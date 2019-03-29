<?php
//============================================================+
// File name   : example_011.php
// Begin       : 2008-03-04
// Last Update : 2013-05-14
//
// Description : Example 011 for TCPDF class
//               Colored Table (very simple table)
//
// Author: Nicola Asuni
//
// (c) Copyright:
//               Nicola Asuni
//               Tecnick.com LTD
//               www.tecnick.com
//               info@tecnick.com
//============================================================+

/**
 * Creates an example PDF TEST document using TCPDF
 * @package com.tecnick.tcpdf
 * @abstract TCPDF - Example: Colored Table
 * @author Nicola Asuni
 * @since 2008-03-04
 */

require_once('tcpdf_min/tcpdf.php');

// extend TCPF with custom functions
class MYPDF extends TCPDF {

    // Tabla con columnas a la izquierda, datos a la derecha
    public function CustomTable($header, $data) {

        // Header
        
        $fill = 0;
        $num_headers = count($header);
        for($i = 0; $i < $num_headers; ++$i) {
            // Colors, line width and bold font
            $this->SetFillColor(255,255,2255);
            $this->SetTextColor(0);
            $this->SetDrawColor(100, 100, 100);
            $this->SetLineWidth(0.1);
            $this->SetFont('', 'B');

            $this->Cell(40, 7, $header[$i].":", "BTL", 0, 'L', 1);


            // Color and font restoration
            $this->SetFillColor(224, 235, 255);
            $this->SetTextColor(0);
            $this->SetFont('');
            // Data
            
            $this->Cell(0, 6, $data[$i], 1, 0, 'C', $fill);
            $this->Ln();
            $fill=!$fill;

        }
        $this->Ln();
        // Color and font restoration
        $this->SetFillColor(224, 235, 255);
        $this->SetTextColor(0);
        $this->SetFont('');

        $this->Cell(0, 0, '', 'T');
    }

    // Tabla normal
    public function NormalTable($header, $data) {
        // Colors, line width and bold font
        $this->SetFillColor(255,255,2255);
        $this->SetTextColor(0);
        $this->SetDrawColor(100, 100, 100);
        $this->SetLineWidth(0.1);
        $this->SetFont('', 'B');
        // Header
        $w = array(40, 35, 30, 40, 40);
        $num_headers = count($header);
        for($i = 0; $i < $num_headers; ++$i) {
            $this->Cell($w[$i], 7, $header[$i], 1, 0, 'C', 1);
        }
        $this->Ln();
        // Color and font restoration
        $this->SetFillColor(224, 235, 255);
        $this->SetTextColor(0);
        $this->SetFont('');
        // Data
        $fill = 0;
        foreach($data as $row) {
            $this->Cell($w[0], 6, $row[0], 'LR', 0, 'C', $fill);
            $this->Cell($w[1], 6, $row[1], 'LR', 0, 'C', $fill);
            $this->Cell($w[2], 6, $row[2], 'LR', 0, 'C', $fill);
            $this->Cell($w[3], 6, $row[3], 'LR', 0, 'C', $fill);
            $this->Cell($w[4], 6, $row[4], 'LR', 0, 'C', $fill);
            $this->Ln();
            $fill=!$fill;
        }
        $this->Cell(array_sum($w), 0, '', 'T');
    }
}



//============================================================+
// END OF FILE
//============================================================+