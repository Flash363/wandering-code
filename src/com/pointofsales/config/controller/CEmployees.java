/*
 * DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS HEADER.
 *
 * Copyright (c) 2020 Oracle and/or its affiliates. All rights reserved.
 *
 * Oracle and Java are registered trademarks of Oracle and/or its affiliates.
 * Other names may be trademarks of their respective owners.
 *
 * The contents of this file are subject to the terms of either the GNU
 * General Public License Version 2 only ("GPL") or the Common
 * Development and Distribution License("CDDL") (collectively, the
 * "License"). You may not use this file except in compliance with the
 * License. You can obtain a copy of the License at
 * http://www.netbeans.org/cddl-gplv2.html
 * or nbbuild/licenses/CDDL-GPL-2-CP. See the License for the
 * specific language governing permissions and limitations under the
 * License.  When distributing the software, include this License Header
 * Notice in each file and include the License file at
 * nbbuild/licenses/CDDL-GPL-2-CP.  Oracle designates this
 * particular file as subject to the "Classpath" exception as provided
 * by Oracle in the GPL Version 2 section of the License file that
 * accompanied this code. If applicable, add the following below the
 * License Header, with the fields enclosed by brackets [] replaced by
 * your own identifying information:
 * "Portions Copyrighted [year] [name of copyright owner]"
 *
 * If you wish your version of this file to be governed by only the CDDL
 * or only the GPL Version 2, indicate your decision by adding
 * "[Contributor] elects to include this software in this distribution
 * under the [CDDL or GPL Version 2] license." If you do not indicate a
 * single choice of license, a recipient has the option to distribute
 * your version of this file under either the CDDL, the GPL Version 2 or
 * to extend the choice of license to its licensees as provided above.
 * However, if you add GPL Version 2 code and therefore, elected the GPL
 * Version 2 license, then the option applies only if the new code is
 * made subject to such option by the copyright holder.
 *
 * Contributor(s):
 */
package com.pointofsales.config.controller;

import com.pointofsales.config.database.ConfigDB;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.DefaultComboBoxModel;
import javax.swing.JOptionPane;
import javax.swing.table.DefaultTableModel;

/**
 *
 * @author Sergey Dmitriev
 */
public class CEmployees extends ConfigDB {

    public DefaultTableModel model = new DefaultTableModel();
    public DefaultComboBoxModel<String> combo;

    public void addItem() {

    }

    public void editItem() {

    }

    public void delItem() {

    }

    public void showRole() {
        try {
            String sql = "SELECT * FROM `Role`";
            pst = conn.prepareStatement(sql);
            rs = pst.executeQuery();
            if (rs.next()) {
                String roleID = rs.getString(1);
                String role = rs.getString(2);
                String[] mod = {role};
                new DefaultComboBoxModel<>(mod);
            }
        } catch (SQLException ex) {
            Logger.getLogger(CEmployees.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    void clearRowTableIfAlreadyExists() {
        int arr = model.getRowCount();
        for (int i = 0; i < arr; i++) {
            model.removeRow(0);
        }
    }

    public void showDataEmployees() {
        try {
            clearRowTableIfAlreadyExists();
            String sql = "SELECT * FROM `vEmployees`";
            String[] col = {"ID", "Nama Depan", "Nama Tengah", "Nama Belakang", "No. Telp", "E-Mail", "Jenis Kelamin", "Role", "Alamat"};
            model.setColumnIdentifiers(col);
            pst = conn.prepareStatement(sql);
            rs = pst.executeQuery();
            while (rs.next()) {
                String a = rs.getString(1);
                String b = rs.getString(2);
                String c = rs.getString(3);
                String d = rs.getString(4);
                String e = rs.getString(5);
                String f = rs.getString(6);
                String h = rs.getString(7);
                String i = rs.getString(8);
                String j = rs.getString(9);
                String[] data = {a, b, c, d, e, f, h, i, j};
                model.addRow(data);
            }
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, "Terjadi Error Pada: \n" + e.toString(), "Error", JOptionPane.ERROR_MESSAGE);
        }
    }

    public void searchDataItem() {

    }
}
