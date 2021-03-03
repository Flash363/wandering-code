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
import com.pointofsales.config.aom.DialogMessage;
import java.sql.SQLException;
import java.sql.Timestamp;
import javax.swing.JOptionPane;
import javax.swing.table.DefaultTableModel;

/**
 *
 * @author Sergey Dmitriev
 */
public class CAdmin extends ConfigDB {

    public DefaultTableModel model = new DefaultTableModel();

    public void addItem(String AdminID, String FullName, String SexID, String Phone, String EMail, String Address, Timestamp JoinDate, String RoleID, String Pass) {
        try {
            pst = conn.prepareStatement("Insert Into Admin Values (?,?,?,?,?,?,?,?,?)");
            pst.setString(1, AdminID);
            pst.setString(2, FullName);
            pst.setString(3, SexID);
            pst.setString(4, Phone);
            pst.setString(5, EMail);
            pst.setString(6, Address);
            pst.setTimestamp(7, JoinDate);
            pst.setString(8, RoleID);
            pst.setString(9, Pass);
            pst.executeUpdate();
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "Terjadi Error Pada: \n" + ex.toString(), "Error", JOptionPane.ERROR_MESSAGE);
        }
    }

    public void editItem(String AdminID, String FullName, String SexID, String Phone, String EMail, String Address, Timestamp JoinDate, String RoleID, String Pass) {
        try {
            pst = conn.prepareStatement("Update Admin Set FullName = ?,GenderID=?,PhoneNumber=?,EMail=?,Address=?,JoinDate=?,RoleID=?,Password=? Where AdminID=?");//
            pst.setString(1, FullName);
            pst.setString(2, SexID);
            pst.setString(3, Phone);
            pst.setString(4, EMail);
            pst.setString(5, Address);
            pst.setTimestamp(6, JoinDate);
            pst.setString(7, RoleID);
            pst.setString(8, Pass);
            pst.setString(9, AdminID);
            pst.executeUpdate();
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "Terjadi Error Pada: \n" + ex.toString(), "Error", JOptionPane.ERROR_MESSAGE);
        }
    }

    public void editItem(String AdminID, String FullName, String SexID, String Phone, String EMail, String Address, Timestamp JoinDate, String RoleID) {
        try {
            pst = conn.prepareStatement("Update Admin Set FullName = ?,GenderID = ?,PhoneNumber = ?,EMail = ?,Address = ?,JoinDate = ?,RoleID = ? Where AdminID = ?");//
            pst.setString(1, FullName);
            pst.setString(2, SexID);
            pst.setString(3, Phone);
            pst.setString(4, EMail);
            pst.setString(5, Address);
            pst.setTimestamp(6, JoinDate);
            pst.setString(7, RoleID);
            pst.setString(8, AdminID);
            pst.executeUpdate();
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "Terjadi Error Pada: \n" + ex.toString(), "Error", JOptionPane.ERROR_MESSAGE);
        }
    }

    public void editItem(String AdminID, String FullName, String SexID, String Phone, String EMail, String Address, String RoleID) {
        try {
            pst = conn.prepareStatement("Update Admin Set FullName = ?,GenderID=?,PhoneNumber=?,EMail=?,Address=?,RoleID=? Where AdminID=?");//
            pst.setString(1, FullName);
            pst.setString(2, SexID);
            pst.setString(3, Phone);
            pst.setString(4, EMail);
            pst.setString(5, Address);
            pst.setString(6, RoleID);
            pst.setString(7, AdminID);
            pst.executeUpdate();
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "Terjadi Error Pada: \n" + ex.toString(), "Error", JOptionPane.ERROR_MESSAGE);
        }
    }

    public void updatePasswordAdmin(int AdminID, String Pass) {
        try {
            pst = conn.prepareStatement("Update Admin Set Password = ? Where AdminID = ?");//
            pst.setString(1, Pass);
            pst.setInt(2, AdminID);
            pst.executeUpdate();
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "Terjadi Error Pada: \n" + ex.toString(), "Error", JOptionPane.ERROR_MESSAGE);
        }
    }

    public void delItem(String AdminID) {
        try {
            pst = conn.prepareStatement("Delete From Admin Where AdminID=?");//
            pst.setString(1, AdminID);
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

    public void showDataItem() {
        try {
            clearRowTableIfAlreadyExists();
            String[] column = {"ID", "Nama Lengkap", "Jenis Kelamin", "No. Telp", "E-Mail", "Alamat", "Role"};
            model.setColumnIdentifiers(column);
            pst = conn.prepareStatement("SELECT * FROM `vAdmin`");
            rs = pst.executeQuery();
            while (rs.next()) {
                String a = rs.getString(1);
                String b = rs.getString(2);
                String c = rs.getString(3);
                String d = rs.getString(4);
                String e = rs.getString(5);
                String f = rs.getString(6);
                String h = rs.getString(7);
                String[] data = {a, b, c, d, e, f, h};
                model.addRow(data);
            }
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "Terjadi Error Pada: \n" + ex.toString(), "Error", JOptionPane.ERROR_MESSAGE);
        }
    }

    public Boolean checkLoginIfUserExistsAndMatched(String userName, String passWord) {
        Boolean bool = false;
        try {
            pst = conn.prepareStatement("SELECT * FROM Admin WHERE FullName = ? AND Password = ?");
            pst.setString(1, userName);
            pst.setString(2, passWord);
            rs = pst.executeQuery();
            if (rs.next()) {
                bool = true;
            }
        } catch (SQLException ex) {
            new DialogMessage().showErrorMessage("Terjadi Error Pada:\n" + ex.getMessage());
        }
        return bool;
    }

    public void searchDataItem() {

    }
}
