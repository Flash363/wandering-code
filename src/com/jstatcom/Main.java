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
package com.jstatcom;

import java.util.Arrays;
import java.util.Collections;

/**
 *
 * @author Sergey Dmitriev <ayuwokibyytess@gmail.com>
 */
public class Main {

    public static void main(String[] args) {
        Integer[] array = {23, -9, 78, 102, 4, 0, -1, 11, 6, 110, 205};
// sorts array[] in descending order   
        Arrays.sort(array, Collections.reverseOrder());
        System.out.println("Array elements in descending order: " + Arrays.toString(array));
    }
}
