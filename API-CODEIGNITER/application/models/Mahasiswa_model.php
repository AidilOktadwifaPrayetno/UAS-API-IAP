<?php

class Mahasiswa_model extends CI_Model
{
    //  <------- Mengambil data mahasiswa ------->
    public function getMahasiswa($id = null)
    {
        if ($id === null) {
            return $this->db->get('mahasiswa')->result_array();
        } else {
            return $this->db->get_where('mahasiswa', ['id' => $id])->result_array();
        }
    }

    //  <------- Menghapus data mahasiswa ------->
    public function deleteMahasiswa($id)
    {
        $this->db->delete('mahasiswa', ['id' => $id]);
        return $this->db->affected_rows();
    }

    //  <------- Menambahkan data mahasiswa ------->
    public function createMahasiswa($data)
    {
        $this->db->insert('mahasiswa', $data);
        return $this->db->affected_rows();
    }

    //  <------- Mengubah data mahasiswa ------->   
    public function updateMahasiswa($data, $id)
    
    {
        $this->db->update('mahasiswa', $data, ['id' => $id]);
        return $this->db->affected_rows();
    }
}