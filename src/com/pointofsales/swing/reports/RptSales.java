/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pointofsales.swing.reports;

import com.pointofsales.config.database.ConfigDB;
import java.awt.BorderLayout;
import java.util.Date;
import java.util.HashMap;
import javax.swing.JOptionPane;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.design.JasperDesign;
import net.sf.jasperreports.engine.xml.JRXmlLoader;
import net.sf.jasperreports.view.JRViewer;

/**
 *
 * @author Sergey Dmitriev
 */
public class RptSales extends javax.swing.JDialog {

    /**
     * Creates new form RptJual
     *
     * @param parent
     * @param modal
     */
    public RptSales(java.awt.Frame parent, boolean modal) {
        super(parent, modal);
        initComponents();
        open();
    }

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jLabel1 = new javax.swing.JLabel();
        jXDatePicker1 = new org.jdesktop.swingx.JXDatePicker();
        jXDatePicker2 = new org.jdesktop.swingx.JXDatePicker();
        jLabel2 = new javax.swing.JLabel();
        jTabbedPane1 = new javax.swing.JTabbedPane();
        pnUmum = new javax.swing.JPanel();
        jPanel1 = new javax.swing.JPanel();
        jPanel2 = new javax.swing.JPanel();
        jPanel3 = new javax.swing.JPanel();
        pnChart = new javax.swing.JPanel();
        jButton1 = new javax.swing.JButton();

        setDefaultCloseOperation(javax.swing.WindowConstants.DISPOSE_ON_CLOSE);
        setResizable(false);

        jLabel1.setFont(new java.awt.Font("Liberation Sans", 0, 14)); // NOI18N
        jLabel1.setText("Tgl. Mulai :");
        jLabel1.setName("jLabel1"); // NOI18N

        jXDatePicker1.setName("jXDatePicker1"); // NOI18N

        jXDatePicker2.setName("jXDatePicker2"); // NOI18N

        jLabel2.setFont(new java.awt.Font("Liberation Sans", 0, 14)); // NOI18N
        jLabel2.setText("Tgl. Akhir :");
        jLabel2.setName("jLabel2"); // NOI18N

        jTabbedPane1.setFont(new java.awt.Font("Liberation Sans", 0, 13)); // NOI18N
        jTabbedPane1.setName("jTabbedPane1"); // NOI18N

        pnUmum.setFont(new java.awt.Font("Liberation Sans", 0, 13)); // NOI18N
        pnUmum.setName("pnUmum"); // NOI18N

        org.jdesktop.layout.GroupLayout pnUmumLayout = new org.jdesktop.layout.GroupLayout(pnUmum);
        pnUmum.setLayout(pnUmumLayout);
        pnUmumLayout.setHorizontalGroup(
            pnUmumLayout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
            .add(0, 1071, Short.MAX_VALUE)
        );
        pnUmumLayout.setVerticalGroup(
            pnUmumLayout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
            .add(0, 484, Short.MAX_VALUE)
        );

        jTabbedPane1.addTab("Penjualan-Rangkuman", pnUmum);

        jPanel1.setFont(new java.awt.Font("Liberation Sans", 0, 13)); // NOI18N
        jPanel1.setName("jPanel1"); // NOI18N

        org.jdesktop.layout.GroupLayout jPanel1Layout = new org.jdesktop.layout.GroupLayout(jPanel1);
        jPanel1.setLayout(jPanel1Layout);
        jPanel1Layout.setHorizontalGroup(
            jPanel1Layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
            .add(0, 1071, Short.MAX_VALUE)
        );
        jPanel1Layout.setVerticalGroup(
            jPanel1Layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
            .add(0, 484, Short.MAX_VALUE)
        );

        jTabbedPane1.addTab("Penjualan Per-Pelanggan", jPanel1);

        jPanel2.setFont(new java.awt.Font("Liberation Sans", 0, 13)); // NOI18N
        jPanel2.setName("jPanel2"); // NOI18N

        org.jdesktop.layout.GroupLayout jPanel2Layout = new org.jdesktop.layout.GroupLayout(jPanel2);
        jPanel2.setLayout(jPanel2Layout);
        jPanel2Layout.setHorizontalGroup(
            jPanel2Layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
            .add(0, 1071, Short.MAX_VALUE)
        );
        jPanel2Layout.setVerticalGroup(
            jPanel2Layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
            .add(0, 484, Short.MAX_VALUE)
        );

        jTabbedPane1.addTab("Penjualan Per-Kasir", jPanel2);

        jPanel3.setFont(new java.awt.Font("Liberation Sans", 0, 13)); // NOI18N
        jPanel3.setName("jPanel3"); // NOI18N

        org.jdesktop.layout.GroupLayout jPanel3Layout = new org.jdesktop.layout.GroupLayout(jPanel3);
        jPanel3.setLayout(jPanel3Layout);
        jPanel3Layout.setHorizontalGroup(
            jPanel3Layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
            .add(0, 1071, Short.MAX_VALUE)
        );
        jPanel3Layout.setVerticalGroup(
            jPanel3Layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
            .add(0, 484, Short.MAX_VALUE)
        );

        jTabbedPane1.addTab("Penjualan-Rincian", jPanel3);

        pnChart.setFont(new java.awt.Font("Liberation Sans", 0, 13)); // NOI18N
        pnChart.setName("pnChart"); // NOI18N

        org.jdesktop.layout.GroupLayout pnChartLayout = new org.jdesktop.layout.GroupLayout(pnChart);
        pnChart.setLayout(pnChartLayout);
        pnChartLayout.setHorizontalGroup(
            pnChartLayout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
            .add(0, 1071, Short.MAX_VALUE)
        );
        pnChartLayout.setVerticalGroup(
            pnChartLayout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
            .add(0, 484, Short.MAX_VALUE)
        );

        jTabbedPane1.addTab("Chart", pnChart);

        jButton1.setFont(new java.awt.Font("Liberation Sans", 0, 14)); // NOI18N
        jButton1.setText("Ok");
        jButton1.setName("jButton1"); // NOI18N
        jButton1.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton1ActionPerformed(evt);
            }
        });

        org.jdesktop.layout.GroupLayout layout = new org.jdesktop.layout.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
            .add(layout.createSequentialGroup()
                .add(21, 21, 21)
                .add(layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
                    .add(jLabel1)
                    .add(jLabel2))
                .add(26, 26, 26)
                .add(layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING, false)
                    .add(jXDatePicker1, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .add(jXDatePicker2, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
                .add(18, 18, 18)
                .add(jButton1, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, 56, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE)
                .addContainerGap(783, Short.MAX_VALUE))
            .add(layout.createSequentialGroup()
                .addContainerGap()
                .add(jTabbedPane1, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, 0, Short.MAX_VALUE)
                .addContainerGap())
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
            .add(layout.createSequentialGroup()
                .add(18, 18, 18)
                .add(layout.createParallelGroup(org.jdesktop.layout.GroupLayout.BASELINE)
                    .add(jLabel1)
                    .add(jXDatePicker1, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(org.jdesktop.layout.LayoutStyle.RELATED)
                .add(layout.createParallelGroup(org.jdesktop.layout.GroupLayout.BASELINE)
                    .add(jLabel2)
                    .add(jXDatePicker2, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE)
                    .add(jButton1))
                .addPreferredGap(org.jdesktop.layout.LayoutStyle.UNRELATED)
                .add(jTabbedPane1)
                .addContainerGap())
        );

        pack();
        setLocationRelativeTo(null);
    }// </editor-fold>//GEN-END:initComponents

    private void jButton1ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton1ActionPerformed
        if (jXDatePicker1.getDate() == null || jXDatePicker2.getDate() == null) {
            JOptionPane.showMessageDialog(null, "Silakan Pilih Tanggal Mulai Dan Tanggal Akhir...");
        } else {
            RptCommonSales();
            RptSalesDetail();
            RptSalesPerCustomer();
            RptSalesPerSalesman();
        }
    }//GEN-LAST:event_jButton1ActionPerformed

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton jButton1;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JPanel jPanel1;
    private javax.swing.JPanel jPanel2;
    private javax.swing.JPanel jPanel3;
    private javax.swing.JTabbedPane jTabbedPane1;
    private org.jdesktop.swingx.JXDatePicker jXDatePicker1;
    private org.jdesktop.swingx.JXDatePicker jXDatePicker2;
    private javax.swing.JPanel pnChart;
    private javax.swing.JPanel pnUmum;
    // End of variables declaration//GEN-END:variables

    private void RptCommonSales() {
        try {
            pnUmum.removeAll();
            pnUmum.repaint();
            pnUmum.revalidate();
            HashMap param = new HashMap();
            param.put("stDate", (Date) jXDatePicker1.getDate());
            param.put("endDate", (Date) jXDatePicker2.getDate());
            String localPath = System.getProperty("user.dir") + "/src/com/resources/jrxml/RptCommonSales.jrxml";
            JasperDesign jDesign = JRXmlLoader.load(localPath);
            JasperReport jReport = JasperCompileManager.compileReport(jDesign);
            JasperPrint jPrint = JasperFillManager.fillReport(jReport, param, new ConfigDB().getConnection());
            JRViewer jView = new JRViewer(jPrint);
            pnUmum.setLayout(new BorderLayout());
            jView.setFitPageZoomRatio();
            jView.setFont(new java.awt.Font("Arial", 0, 14));
            pnUmum.add(jView);
        } catch (JRException ex) {
            JOptionPane.showMessageDialog(null, "Terjadi Error Pada:\n" + ex.toString(), "Kesalahan", JOptionPane.ERROR_MESSAGE);
        }
    }

    private void RptSalesPerCustomer() {
        try {
            jPanel1.removeAll();
            jPanel1.repaint();
            jPanel1.revalidate();
            HashMap param = new HashMap();
            param.put("stDate", (Date) jXDatePicker1.getDate());
            param.put("endDate", (Date) jXDatePicker2.getDate());
            String localPath = System.getProperty("user.dir") + "/src/com/resources/jrxml/rptSalesPerCustomer.jrxml";
            JasperDesign jDesign = JRXmlLoader.load(localPath);
            JasperReport jReport = JasperCompileManager.compileReport(jDesign);
            JasperPrint jPrint = JasperFillManager.fillReport(jReport, param, new ConfigDB().getConnection());
            JRViewer jView = new JRViewer(jPrint);
            jPanel1.setLayout(new BorderLayout());
            jView.setFitPageZoomRatio();
            jView.setFont(new java.awt.Font("Arial", 0, 14));
            jPanel1.add(jView);
        } catch (JRException ex) {
            JOptionPane.showMessageDialog(null, "Terjadi Error Pada:\n" + ex.toString(), "Kesalahan", JOptionPane.ERROR_MESSAGE);
        }
    }

    private void RptSalesPerSalesman() {
        try {
            jPanel2.removeAll();
            jPanel2.repaint();
            jPanel2.revalidate();
            HashMap param = new HashMap();
            param.put("stDate", (Date) jXDatePicker1.getDate());
            param.put("endDate", (Date) jXDatePicker2.getDate());
            String localPath = System.getProperty("user.dir") + "/src/com/resources/jrxml/RptSalesPerCashier.jrxml";
            JasperDesign jDesign = JRXmlLoader.load(localPath);
            JasperReport jReport = JasperCompileManager.compileReport(jDesign);
            JasperPrint jPrint = JasperFillManager.fillReport(jReport, param, new ConfigDB().getConnection());
            JRViewer jView = new JRViewer(jPrint);
            jPanel2.setLayout(new BorderLayout());
            jView.setFitPageZoomRatio();
            jView.setFont(new java.awt.Font("Arial", 0, 14));
            jPanel2.add(jView);
        } catch (JRException ex) {
            JOptionPane.showMessageDialog(null, "Terjadi Error Pada:\n" + ex.toString(), "Kesalahan", JOptionPane.ERROR_MESSAGE);
        }
    }

    private void RptSalesDetail() {
        try {
            jPanel3.removeAll();
            jPanel3.repaint();
            jPanel3.revalidate();
            HashMap param = new HashMap();
            param.put("stDate", (Date) jXDatePicker1.getDate());
            param.put("endDate", (Date) jXDatePicker2.getDate());
            String localPath = System.getProperty("user.dir") + "/src/com/resources/jrxml/RptSalesDetail.jrxml";
            JasperDesign jDesign = JRXmlLoader.load(localPath);
            JasperReport jReport = JasperCompileManager.compileReport(jDesign);
            JasperPrint jPrint = JasperFillManager.fillReport(jReport, param, new ConfigDB().getConnection());
            JRViewer jView = new JRViewer(jPrint);
            jPanel3.setLayout(new BorderLayout());
            jView.setFitPageZoomRatio();
            jView.setFont(new java.awt.Font("Arial", 0, 14));
            jPanel3.add(jView);
        } catch (JRException ex) {
            JOptionPane.showMessageDialog(null, "Terjadi Error Pada:\n" + ex.toString(), "Kesalahan", JOptionPane.ERROR_MESSAGE);
        }
    }

    private void RptSalesChart() {
        try {
            pnChart.removeAll();
            pnChart.repaint();
            pnChart.revalidate();
            HashMap param = new HashMap();
            param.put("stDate", (Date) jXDatePicker1.getDate());
            param.put("endDate", (Date) jXDatePicker2.getDate());
            String localPath = System.getProperty("user.dir") + "/src/com/resources/jrxml/RptCommonSales.jrxml";
            JasperDesign jDesign = JRXmlLoader.load(localPath);
            JasperReport jReport = JasperCompileManager.compileReport(jDesign);
            JasperPrint jPrint = JasperFillManager.fillReport(jReport, param, new ConfigDB().getConnection());
            JRViewer jView = new JRViewer(jPrint);
            pnChart.setLayout(new BorderLayout());
            jView.setFitPageZoomRatio();
            jView.setFont(new java.awt.Font("Arial", 0, 14));
            pnChart.add(jView);
        } catch (JRException ex) {
            JOptionPane.showMessageDialog(null, "Terjadi Error Pada:\n" + ex.toString(), "Kesalahan", JOptionPane.ERROR_MESSAGE);
        }
    }

    private void open() {
        jXDatePicker1.setFont(new java.awt.Font("Liberation Sans", 0, 14));
        jXDatePicker2.setFont(new java.awt.Font("Liberation Sans", 0, 14));
    }
}
