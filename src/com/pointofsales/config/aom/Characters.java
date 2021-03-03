/*
 * Copyright (C) 2021 Sergey Dmitriev <ayuwokibyytess@gmail.com>
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

import java.awt.event.KeyEvent;

/**
 *
 * @author Sergey Dmitriev <ayuwokibyytess@gmail.com>
 */
public class Characters {

    public Characters() {
        super();
    }

    public static void setDontWriteCharactersExceptNumber(java.awt.event.KeyEvent evt) {
        char c = evt.getKeyChar();
        if (!(Character.isDigit(c) || (c == KeyEvent.VK_BACK_SPACE) || c == KeyEvent.VK_DELETE)) {
            evt.consume();
        }
    }
}
