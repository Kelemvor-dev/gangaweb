<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
/**
 * CodeIgniter
 *
 * An open source application development framework for PHP 5.2.4 or newer
 *
 * NOTICE OF LICENSE
 *
 * Licensed under the Open Software License version 3.0
 *
 * This source file is subject to the Open Software License (OSL 3.0) that is
 * bundled with this package in the files license.txt / license.rst.  It is
 * also available through the world wide web at this URL:
 * http://opensource.org/licenses/OSL-3.0
 * If you did not receive a copy of the license and are unable to obtain it
 * through the world wide web, please send an email to
 * licensing@ellislab.com so we can send you a copy immediately.
 *
 * @package		CodeIgniter
 * @author		EllisLab Dev Team
 * @copyright	Copyright (c) 2008 - 2012, EllisLab, Inc. (http://ellislab.com/)
 * @license		http://opensource.org/licenses/OSL-3.0 Open Software License (OSL 3.0)
 * @link		http://codeigniter.com
 * @since		Version 1.0
 * @filesource
 */

/**
 * Database Utility Class
 *
 * @category	Database
 * @author		EllisLab Dev Team
 * @link		http://codeigniter.com/user_guide/database/
 */
abstract class CI_DB_utility extends CI_DB_forge {

	public $db;

	// Platform specific SQL strings
	// Just setting those defaults to FALSE as they are mostly MySQL-specific
	protected $_optimize_table	= FALSE;
	protected $_repair_table	= FALSE;

	public function __construct()
	{
		// Assign the main database object to $this->db
		$CI =& get_instance();
		$this->db =& $CI->db;
		log_message('debug', 'Database Utility Class Initialized');
	}

	// --------------------------------------------------------------------

	/**
	 * List databases
	 *
	 * @return	array
	 */
	public function list_databases()
	{
		// Is there a cached result?
		if (isset($this->db->data_cache['db_names']))
		{
			return $this->db->data_cache['db_names'];
		}
		elseif ($this->_list_databases === FALSE)
		{
			return ($this->db->db_debug) ? $this->db->display_error('db_unsuported_feature') : FALSE;
		}

		$this->db->data_cache['db_names'] = array();

		$query = $this->db->query($this->_list_databases);
		if ($query === FALSE)
		{
			return $this->db->data_cache['db_names'];
		}

		for ($i = 0, $c = count($query); $i < $c; $i++)
		{
			$this->db->data_cache['db_names'] = current($query[$i]);
		}

		return $this->db->data_cache['db_names'];
	}

	// --------------------------------------------------------------------

	/**
	 * Determine if a particular database exists
	 *
	 * @param	string
	 * @return	bool
	 */
	public function database_exists($database_name)
	{
		return in_array($database_name, $this->list_databases());
	}

	// --------------------------------------------------------------------

	/**
	 * Optimize Table
	 *
	 * @param	string	the table name
	 * @return	mixed
	 */
	public function optimize_table($table_name)
	{
		if ($this->_optimize_table === FALSE)
		{
			return ($this->db->db_debug) ? $this->db->display_error('db_unsuported_feature') : FALSE;
		}

		$query = $this->db->query(sprintf($this->_optimize_table, $this->db->escape_identifiers($table_name)));
		if ($query !== FALSE)
		{
			$query = $query->result_array();
			return current($res);
		}

		return FALSE;
	}

	// --------------------------------------------------------------------

	/**
	 * Optimize Database
	 *
	 * @return	mixed
	 */
	public function optimize_database()
	{
		if ($this->_optimize_table === FALSE)
		{
			return ($this->db->db_debug) ? $this->db->display_error('db_unsuported_feature') : FALSE;
		}

		$result = array();
		foreach ($this->db->list_tables() as $table_name)
		{
			$res = $this->db->query(sprintf($this->_optimize_table, $this->db->escape_identifiers($table_name)));
			if (is_bool($res))
			{
				return $res;
			}

			// Build the result array...
			$res = $res->result_array();
			$res = current($res);
			$key = str_replace($this->db->database.'.', '', current($res));
			$keys = array_keys($res);
			unset($res[$keys[0]]);

			$result[$key] = $res;
		}

		return $result;
	}

	// --------------------------------------------------------------------

	/**
	 * Repair Table
	 *
	 * @param	string	the table name
	 * @return	mixed
	 */
	public function repair_table($table_name)
	{
		if ($this->_repair_table === FALSE)
		{
			return ($this->db->db_debug) ? $this->db->display_error('db_unsuported_feature') : FALSE;
		}

		$query = $this->db->query(sprintf($this->_repair_table, $this->db->escape_identifiers($table_name)));
		if (is_bool($query))
		{
			return $query;
		}

		$query = $query->result_array();
		return current($query);
	}

	// --------------------------------------------------------------------

	/**
	 * Generate CSV from a query result object
	 *
	 * @param	object	The query result object
	 * @param	string	The delimiter - comma by default
	 * @param	string	The newline character - \n by default
	 * @param	string	The enclosure - double quote by default
	 * @return	string
	 */
	public function csv_from_result($query, $delim = ',', $newline = "\n", $enclosure = '"')
	{
		if ( ! is_object($query) OR ! method_exists($query, 'list_fields'))
		{
			show_error('You must submit a valid result object');
		}

		$out = '';
		// First generate the headings from the table column names
		foreach ($query->list_fields() as $name)
		{
			$out .= $enclosure.str_replace($enclosure, $enclosure.$enclosure, $name).$enclosure.$delim;
		}

		$out = rtrim($out).$newline;

		// Next blast through the result array and build out the rows
		while ($row = $query->unbuffered_row('array'))
		{
			foreach ($row as $item)
			{
				$out .= $enclosure.str_replace($enclosure, $enclosure.$enclosure, $item).$enclosure.$delim;
			}
			$out = rtrim($out).$newline;
		}

		return $out;
	}

	// --------------------------------------------------------------------

	/**
	 * Generate XML data from a query result object
	 *
	 * @param	object	The query result object
	 * @param	array	Any preferences
	 * @return	string
	 */
	public function xml_from_result($query, $params = array())
	{
		if ( ! is_object($query) OR ! method_exists($query, 'list_fields'))
		{
			show_error('You must submit a valid result object');
		}

		// Set our default values
		foreach (array('root' => 'root', 'element' => 'element', 'newline' => "\n", 'tab' => "\t") as $key => $val)
		{
			if ( ! isset($params[$key]))
			{
				$params[$key] = $val;
			}
		}

		// Create variables for convenience
		extract($params);

		// Load the xml helper
		$CI =& get_instance();
		$CI->load->helper('xml');

		// Generate the result
		$xml = '<'.$root.'>'.$newline;
		while ($row = $query->unbuffered_row())
		{
			$xml .= $tab.'<'.$element.'>'.$newline;
			foreach ($row as $key => $val)
			{
				$xml .= $tab.$tab.'<'.$key.'>'.xml_convert($val).'</'.$key.'>'.$newline;
			}
			$xml .= $tab.'</'.$element.'>'.$newline;
		}

		return $xml.'</'.$root.'>'.$newline;
	}

	// --------------------------------------------------------------------

	/**
	 * Database Backup
	 *
	 * @return	void
	 */
	public function backup($params = array())
	{
		// If the parameters have not been submitted as an
		// array then we know that it is simply the table
		// name, which is a valid short cut.
		if (is_string($params))
		{
			$params = array('tables' => $params);
		}

		// ------------------------------------------------------

		// Set up our default preferences
		$prefs = array(
				'tables'		=> array(),
				'ignore'		=> array(),
				'filename'		=> '',
				'format'		=> 'gzip', // gzip, zip, txt
				'add_drop'		=> TRUE,
				'add_insert'		=> TRUE,
				'newline'		=> "\n"
			);

		// Did the user submit any preferences? If so set them....
		if (count($params) > 0)
		{
			foreach ($prefs as $key => $val)
			{
				if (isset($params[$key]))
				{
					$prefs[$key] = $params[$key];
				}
			}
		}

		// Are we backing up a complete database or individual tables?
		// If no table names were submitted we'll fetch the entire table list
		if (count($prefs['tables']) === 0)
		{
			$prefs['tables'] = $this->db->list_tables();
		}

		// Validate the format
		if ( ! in_array($prefs['format'], array('gzip', 'zip', 'txt'), TRUE))
		{
			$prefs['format'] = 'txt';
		}

		// Is the encoder supported? If not, we'll either issue an
		// error or use plain text depending on the debug settings
		if (($prefs['format'] === 'gzip' && ! @function_exists('gzencode'))
			OR ($prefs['format'] === 'zip' && ! @function_exists('gzcompress')))
		{
			if ($this->db->db_debug)
			{
				return $this->db->display_error('db_unsuported_compression');
			}

			$prefs['format'] = 'txt';
		}

		// Was a Zip file requested?
		if ($prefs['format'] === 'zip')
		{
			// Set the filename if not provided (only needed with Zip files)
			if ($prefs['filename'] === '')
			{
				$prefs['filename'] = (count($prefs['tables']) === 1 ? $prefs['tables'] : $this->db->database)
							.date('Y-m-d_H-i', time()).'.sql';
			}
			else
			{
				// If they included the .zip file extension we'll remove it
				if (preg_match('|.+?\.zip$|', $prefs['filename']))
				{
					$prefs['filename'] = str_replace('.zip', '', $prefs['filename']);
				}

				// Tack on the ".sql" file extension if needed
				if ( ! preg_match('|.+?\.sql$|', $prefs['filename']))
				{
					$prefs['filename'] .= '.sql';
				}
			}

			// Load the Zip class and output it
			$CI =& get_instance();
			$CI->load->library('zip');
			$CI->zip->add_data($prefs['filename'], $this->_backup($prefs));
			return $CI->zip->get_zip();
		}
		elseif ($prefs['format'] === 'txt') // Was a text file requested?
		{
			return $this->_backup($prefs);
		}
		elseif ($prefs['format'] === 'gzip') // Was a Gzip file requested?
		{
			return gzencode($this->_backup($prefs));
		}

		return;
	}

}

/* End of file DB_utility.php */
/* Location: ./system/database/DB_utility.php */