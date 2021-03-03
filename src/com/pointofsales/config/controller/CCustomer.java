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
import javax.swing.JOptionPane;
import javax.swing.table.DefaultTableModel;

/**
 *
 * @author Sergey Dmitriev
 */
public class CCustomer extends ConfigDB {

    public DefaultTableModel model = new DefaultTableModel();

    public void addItem(String a, String b, String c, String d, String e, String f, String h, String i) {
        try {
            pst = conn.prepareStatement("Insert Into Customers Values (?,?,?,?,?,?,?,?)");
            pst.setString(1, a);
            pst.setString(2, b);
            pst.setString(3, c);
            pst.setString(4, d);
            pst.setString(5, e);
            pst.setString(6, f);
            pst.setString(7, h);
            pst.setString(8, i);
            pst.executeUpdate();
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "Terjadi Error Pada: \n" + ex.toString(), "Error", JOptionPane.ERROR_MESSAGE);
        }
    }

    public void editItem(String a, String b, String c, String d, String e, String f, String h, String i) {
        try {
            pst = conn.prepareStatement("Update Customers Set CustName = ?,Address=?,City=?,State=?,PostalCode=?,Phone=?,EMail=? Where CustID = ?");
            pst.setString(1, b);
            pst.setString(2, c);
            pst.setString(3, d);
            pst.setString(4, e);
            pst.setString(5, f);
            pst.setString(6, h);
            pst.setString(7, i);
            pst.setString(8, a);
            pst.executeUpdate();
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "Terjadi Error Pada: \n" + ex.toString(), "Error", JOptionPane.ERROR_MESSAGE);
        }
    }

    public void delItem(String a) {
        try {
            pst = conn.prepareStatement("Delete From Customers Where CustID = ?");
            pst.setString(1, a);
            pst.executeUpdate();
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "Terjadi Error Pada: \n" + ex.toString(), "Error", JOptionPane.ERROR_MESSAGE);
        }
    }

    void clearRowTableIfAlreadyExists() {
        int arr = model.getRowCount();
        for (int i = 0; i < arr; i++) {
            model.removeRow(0);
        }
    }

    public void showDataCustomers() {
        try {
            clearRowTableIfAlreadyExists();
            String sql = "SELECT * FROM Customers";
            String[] col = {"ID", "Nama", "Alamat", "Kota/Kabupaten", "Negara", "Kode POS", "No. Telp", "E-Mail"};
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
                String[] data = {a, b, c, d, e, f, h, i};
                model.addRow(data);
            }
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, "Terjadi Error Pada: \n" + e.toString(), "Error", JOptionPane.ERROR_MESSAGE);
        }
    }

    public void searchData(String teksCari) {
        try {
            clearRowTableIfAlreadyExists();
            String sql = "SELECT * FROM `Customers` Where CustName Like '%" + teksCari + "%' ";
            String[] col = {"ID", "Nama", "Alamat", "Kota/Kabupaten", "Negara", "Kode POS", "No. Telp", "E-Mail"};
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
                String[] data = {a, b, c, d, e, f, h, i};
                model.addRow(data);
            }
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "Terjadi Error\n" + ex.toString(), "Kesalahan", JOptionPane.ERROR_MESSAGE);
        }
    }
}
