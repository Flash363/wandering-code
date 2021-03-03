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
public class CProduct extends ConfigDB {

    public DefaultTableModel model = new DefaultTableModel();
    public DefaultTableModel uModel = new DefaultTableModel();

    /**
     * Method Ini Digunakan Untuk Me-Refresh Tabel Ketika Ada Data Yang Di
     * Update dan Ditambah, Dengan Tujuan Agar Data Tidak Terlihat Terduplikat
     */
    private void clearRowTableIfAlreadyExists() {
        int arr = model.getRowCount();
        for (int i = 0; i < arr; i++) {
            model.removeRow(0);
        }
    }

    void clearRowTable() {
        int arr = uModel.getRowCount();
        for (int i = 0; i < arr; i++) {
            uModel.removeRow(0);
        }
    }

    public void addItem(String pId, String bCodeID, String pName, int sPrice,
            int cPrice, String netto, int stock, int unitID, int supID, String expDate) {
        try {
            String sql = "Insert Into Products Values (?,?,?,?,?,?,?,?,?,?)";
            pst = conn.prepareStatement(sql);
            pst.setString(1, null);
            pst.setString(2, bCodeID);
            pst.setString(3, pName);
            pst.setInt(4, sPrice);
            pst.setInt(5, cPrice);
            pst.setString(6, netto);
            pst.setInt(7, stock);
            pst.setInt(8, unitID);
            pst.setInt(9, supID);
            pst.setString(10, expDate);
            pst.executeUpdate();
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "Terjadi Error Pada: \n" + ex.toString(), "Error", JOptionPane.ERROR_MESSAGE);
        }
    }

    public void addNewItem(String a, String b, String c, int d, int e, String f, int g, int h, int i, String j) {
        try {
            String sql = "Insert Into Products Values (?,?,?,?,?,?,?,?,?,?)";
            pst = conn.prepareStatement(sql);
            pst.setString(1, null);
            pst.setString(2, b);
            pst.setString(3, c);
            pst.setInt(4, d);
            pst.setInt(5, e);
            pst.setString(6, f);
            pst.setInt(7, g);
            pst.setInt(8, h);
            pst.setInt(9, i);
            pst.setString(10, j);
            pst.executeUpdate();
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "Terjadi Error Pada: \n" + ex.toString(), "Error", JOptionPane.ERROR_MESSAGE);
        }
    }

    public void addUnit(String unitID, String unitName) {
        try {
            String sql = "Insert Into ProdUnit Values (?,?)";
            pst = conn.prepareStatement(sql);
            pst.setString(1, unitID);
            pst.setString(2, unitName);
            pst.executeUpdate();
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "Terjadi Error Pada: \n" + ex.toString(), "Error", JOptionPane.ERROR_MESSAGE);
        }
    }

    public void updateData(String bCodeID, String pName, int sPrice,
            int cPrice, String netto, int stock, int unitID, int supplierID, String expDate, String pId) {
        try {
            String sql = "UPDATE Products SET BarcodeID = ?, ProdName = ?, SellPrice = ?, CostPrice = ?, Netto = ?, Stock = ?, UnitID = ?, SupplierID = ?, ExpireDate = ? WHERE ProductID = ?";
            pst = conn.prepareStatement(sql);
            pst.setString(1, bCodeID);
            pst.setString(2, pName);
            pst.setInt(3, sPrice);
            pst.setInt(4, cPrice);
            pst.setString(5, netto);
            pst.setInt(6, stock);
            pst.setInt(7, unitID);
            pst.setInt(8, supplierID);
            pst.setString(9, expDate);
            pst.setString(10, pId);
            pst.executeUpdate();
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "Terjadi Error Pada: \n" + ex.toString(), "Error", JOptionPane.ERROR_MESSAGE);
        }
    }

    public void deleteItem(String pId) {
        try {
            String sql = "Delete From Products Where ProductID = ?";
            pst = conn.prepareStatement(sql);
            pst.setString(1, pId);
            pst.executeUpdate();
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "Terjadi Error Pada: \n" + ex.toString(), "Error", JOptionPane.ERROR_MESSAGE);
        }
    }

    public void showDataProduct() {
        try {
            clearRowTableIfAlreadyExists();
            String sql = "SELECT * FROM ViewProducts";
            String[] col = {"ID", "Barcode", "Name", "Sell Price (IDR)", "Cost Price (IDR)", "Netto", "Stock", "Unit", "Suppliers", "Exp. Date"};
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
                String k = rs.getString(10);
                String[] data = {a, b, c, d, e, f, h, i, j, k};
                model.addRow(data);
            }
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, "Terjadi Error Pada: \n" + e.toString(), "Error", JOptionPane.ERROR_MESSAGE);
        }
    }

    public void sortProductOrderBy(String sortValue) {
        try {
            clearRowTable();
            String sql = "SELECT * FROM `vProduct` ORDER BY Category = " + sortValue;
            String[] col = {"ID", "Barcode", "Name", "Sell Price (IDR)", "Cost Price (IDR)", "Netto", "Stock", "Unit", "Suppliers", "Exp. Date"};
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
                String k = rs.getString(10);
                String[] data = {a, b, c, d, e, f, h, i, j, k};
                model.addRow(data);
            }
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "Terjadi Error Pada: \n" + ex.toString(), "Error", JOptionPane.ERROR_MESSAGE);
        }
    }

    public void showDataProductIfStockIsOverated() {
        try {
            clearRowTableIfAlreadyExists();
            String sql = "SELECT Products.ProductID AS ID,Products.BarcodeID AS BarcodeID,Products.ProdName AS Name,"
                    + "Products.SellPrice AS SellPrice,Products.CostPrice AS CostPrice,Products.Netto,Products.Stock,ProdUnit.UnitName AS Unit,"
                    + "Suppliers.CompanyName AS Suppliers,Products.ExpireDate FROM Products"
                    + " INNER JOIN ProdUnit ON Products.UnitID = ProdUnit.UnitID "
                    + "INNER JOIN Suppliers ON Products.SupplierID = Suppliers.SupID WHERE Products.Stock >10";
            String[] col = {"ID", "Barcode", "Name", "Sell Price (IDR)", "Cost Price (IDR)", "Netto", "Stock", "Unit", "Suppliers", "Exp. Date"};
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
                String k = rs.getString(10);
                String[] data = {a, b, c, d, e, f, h, i, j, k};
                model.addRow(data);
            }
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, "Terjadi Error Pada: \n" + e.toString(), "Error", JOptionPane.ERROR_MESSAGE);
        }
    }

    public void showDataProductIfStockIsLimited() {
        try {
            clearRowTableIfAlreadyExists();
            String sql = "SELECT Products.ProductID AS ID,Products.BarcodeID AS BarcodeID,Products.ProdName AS Name,Products.SellPrice AS SellPrice,"
                    + "Products.CostPrice AS CostPrice,Products.Netto,Products.Stock,ProdUnit.UnitName AS Unit,Suppliers.CompanyName AS Suppliers,"
                    + "Products.ExpireDate FROM Products INNER JOIN ProdUnit ON Products.UnitID = ProdUnit.UnitID "
                    + "INNER JOIN Suppliers ON Products.SupplierID = Suppliers.SupID WHERE Products.Stock < 10";
            String[] col = {"ID", "Barcode", "Name", "Sell Price (IDR)", "Cost Price (IDR)", "Netto", "Stock", "Unit", "Suppliers", "Exp. Date"};
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
                String k = rs.getString(10);
                String[] data = {a, b, c, d, e, f, h, i, j, k};
                model.addRow(data);
            }
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, "Terjadi Error Pada: \n" + e.toString(), "Error", JOptionPane.ERROR_MESSAGE);
        }
    }

    public void showDataProductUnit() {
        try {
            clearRowTable();
            String sql = "SELECT * FROM ProdUnit`";
            String[] col = {"ID", "Nama"};
            uModel.setColumnIdentifiers(col);
            pst = conn.prepareStatement(sql);
            rs = pst.executeQuery();
            while (rs.next()) {
                String a = rs.getString(1);
                String b = rs.getString(2);
                String[] data = {a, b};
                uModel.addRow(data);
            }
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, "Terjadi Error Pada: \n" + e.toString(), "Error", JOptionPane.ERROR_MESSAGE);
        }
    }

    public void searchData(String teksCari) {
        try {
            clearRowTableIfAlreadyExists();
            String sql = "SELECT * FROM ViewProducts Where ViewProducts.ProductName Like '%" + teksCari + "%' ";
            String[] col = {"ID", "Barcode", "Name", "Sell Price (IDR)", "Cost Price (IDR)", "Netto", "Stock", "Unit", "Suppliers", "Exp. Date"};
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
                String k = rs.getString(10);
                String[] data = {a, b, c, d, e, f, h, i, j, k};
                model.addRow(data);
            }
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "Terjadi Error\n" + ex.toString(), "Kesalahan", JOptionPane.ERROR_MESSAGE);
        }
    }
}
