/*
 * Copyright (C) 2020 flash
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */
package com.pointofsales.config.controller;

import com.pointofsales.swing.transaction.sales.Invoices;
import java.sql.Connection;
import java.util.HashMap;
import java.util.Objects;
import javax.swing.JOptionPane;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperPrintManager;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.design.JasperDesign;
import net.sf.jasperreports.engine.xml.JRXmlLoader;
import net.sf.jasperreports.view.JasperViewer;

/**
 *
 * @author flash
 */
public class Printable {

    /**
     * Membuat Objek Data Dan Meload Laporan Struk Penjualan
     *
     * @param hashkey
     * @param hashValue
     * @param filePath
     * @param conn
     */
    public static void printInvoices(String hashkey, Object hashValue, String filePath, Connection conn) {
        try {
            //int SaleID = autoNumber;
            HashMap hash = new HashMap();
            hash.put(hashkey, hashValue);
            JasperDesign jDesign = JRXmlLoader.load(filePath);
            JasperReport jReport = JasperCompileManager.compileReport(jDesign);
            JasperPrint jPrint = JasperFillManager.fillReport(jReport, hash, conn);
            JasperViewer jView = new JasperViewer(jPrint);
            //JasperPrintManager.printReport(jPrint, true);
            Invoices inv = new Invoices(null, true);
            inv.setContentPane(jView.getContentPane());
            inv.setTitle("Struk Penjualan");
            inv.setResizable(false);
            jView.setFitPageZoomRatio();
            jView.setFitWidthZoomRatio();
            inv.setVisible(true);
        } catch (JRException ex) {
            JOptionPane.showMessageDialog(null, "Error :\n" + ex.toString(), "Kesalahan", JOptionPane.PLAIN_MESSAGE);
        }
    }

    /**
     * Membuat Objek Data Dan Meload Laporan Struk Penjualan
     *
     * @param hashKey
     * @param hashValue
     * @param filePath
     * @param conn
     * @param autoPrint
     */
    public static void printInvoices(String hashKey, Object hashValue, String filePath, Connection conn, Boolean autoPrint) {
        try {
            //int SaleID = autoNumber;
            HashMap hashMap = new HashMap();
            hashMap.put(hashKey, hashValue);
            JasperDesign jDesign = JRXmlLoader.load(filePath);
            JasperReport jReport = JasperCompileManager.compileReport(jDesign);
            JasperPrint jPrint = JasperFillManager.fillReport(jReport, hashMap, conn);
            JasperViewer jView = new JasperViewer(jPrint);
            if (Objects.equals(autoPrint, Boolean.TRUE)) {
                JasperPrintManager.printReport(jPrint, true);
            } else {
                JasperPrintManager.printReport(jPrint, false);
                Invoices inv = new Invoices(null, true);
                inv.setContentPane(jView.getContentPane());
                inv.setTitle("Struk Penjualan");
                inv.setResizable(false);
                jView.setFitPageZoomRatio();
                jView.setFitWidthZoomRatio();
                inv.setVisible(true);
            }
        } catch (JRException ex) {
            JOptionPane.showMessageDialog(null, "Error :\n" + ex.toString(), "Kesalahan", JOptionPane.PLAIN_MESSAGE);
        }
    }
}
