/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.accede.angel.services;

import com.accede.angel.admin.dao.AdminDao;
import com.accede.angel.admin.dao.AdminPrevilleagesDao;
import com.accede.angel.admin.model.Admin;
import com.accede.angel.admin.model.AdminPrevilleages;
import com.accede.angel.admin.model.Branch;

/**
 *
 * @author Admin
 */
public class test {

    public static void main(String[] args) {
      
        Admin a = new Admin();
           
            AdminDao aa = new AdminDao();
            int id=3;
        a=aa.getAdminByID(id);
        AdminPrevilleagesDao AdminPrevilleagesDao = new AdminPrevilleagesDao();
        AdminPrevilleages AdminPrevilleages = new AdminPrevilleages();
        AdminPrevilleages AdminPrevilleages1 = new AdminPrevilleages();
        AdminPrevilleages.setAdmin(a);
        AdminPrevilleages.setAdmintype("2");
        AdminPrevilleagesDao.saveAdminPrevilleages(AdminPrevilleages);
        AdminPrevilleages1.setAdmin(a);
        AdminPrevilleages1.setAdmintype("3");
        AdminPrevilleagesDao.saveAdminPrevilleages(AdminPrevilleages1);
    }
}
