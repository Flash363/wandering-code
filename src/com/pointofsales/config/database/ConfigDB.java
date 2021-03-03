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
 * particular file as subject to the "Classpath" excepexceptiontion as provided
 * by Oracle in the GPL Version 2 section of the License file that
 * accompanied this code. If applicable, add the following below the
 * License Header, with the fields enclosed by brackets [] replaced by
 * your own identifying information:
 * "Portions Copyrighted [year] [name of copyright owner]"
 * 135792468
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
package com.pointofsales.config.database;

import com.pointofsales.config.aom.DialogMessage;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author Sergey Dmitriev
 */
public class ConfigDB {

    public java.sql.Connection conn;
    public java.sql.PreparedStatement pst;
    public java.sql.ResultSet rs;

    public ConfigDB() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            String dbHost = "localhost";
            int dbPort = 3306;
            String dbUser = "root";
            String dbPassword = "";
            String dbDatabase = "minipos";
            conn = DriverManager.getConnection("jdbc:mysql://" + dbHost + ":" + dbPort + "/" + dbDatabase, dbUser, dbPassword);
        } catch (ClassNotFoundException | SQLException ex) {
            new DialogMessage().showErrorMessage("<html><h1>Koneksi Database Gagal..!!!</h1></html>\nTerjadi Error Pada:\n" + ex.getMessage());
            System.exit(0);
        }
    }

    /**
     * Mendapatkan Objek Koneksi Tanpa Deklarasi Ulang
     *
     * @return
     */
    public Connection getConnection() {
        return conn;
    }

    public Connection autoReconnect() {
        return getConnection();
    }

    public Statement createStatement() throws SQLException {
        return conn.createStatement();
    }
}
