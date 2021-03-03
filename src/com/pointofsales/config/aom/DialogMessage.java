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
package com.pointofsales.config.aom;

import javax.swing.ImageIcon;
import javax.swing.JOptionPane;

/**
 *
 * @author flash
 */
public class DialogMessage extends javax.swing.JOptionPane implements Dialog {

    protected Object message;

    @Override
    public void showWarningMessage(String warningMessage) {
        JOptionPane.showMessageDialog(this, warningMessage, "Perhatian", JOptionPane.WARNING_MESSAGE);
    }

    @Override
    public void showErrorMessage(String errorMessage) {
        JOptionPane.showMessageDialog(this, errorMessage, "Error", JOptionPane.ERROR_MESSAGE);
    }

    @Override
    public void showInformationMessage(String informationMessage) {
        JOptionPane.showMessageDialog(this, informationMessage, "Informasi", JOptionPane.INFORMATION_MESSAGE);
    }

    @Override
    public void showPlainMessage(String plainMessage) {
        JOptionPane.showMessageDialog(this, plainMessage, "Pesan", JOptionPane.PLAIN_MESSAGE);
    }

    @Override
    public void openForms() {

    }

    public ImageIcon getOkIcon() {
        return new javax.swing.ImageIcon("src/com/minipos/resource/icon/icons8-ok-48.png");
    }

    @Override
    public void showWarningMessage(String dial, Exception ex) {
        JOptionPane.showMessageDialog(this, dial + ex.toString(), "Perhatian", JOptionPane.WARNING_MESSAGE);
    }

    @Override
    public void showErrorMessage(String dial, Exception ex) {
        JOptionPane.showMessageDialog(this, dial + ex.toString(), "Error", JOptionPane.ERROR_MESSAGE);
    }
}
