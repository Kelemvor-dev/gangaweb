<?php

(defined('BASEPATH')) OR exit('No direct script access allowed');

function get_property_by_building($id) {
    $CI = & get_instance();
    return $CI->db->where('id', $id)->get('properties')->row();
}

function get_building_by_document($document) {
    $CI = & get_instance();
    $building = $CI->db->where('documento_id', $document)->get('recident_to_building')->row();
    if (!empty($building)) {
        $property = $CI->db->where('id', $building->building_id)->get('building')->row();
        $result = get_property_by_building($property->property_id)->name;
    } else {
        $result = 'Sin Asignar';
    }
    return $result;
}
