/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.utilities;

import org.apache.commons.codec.digest.DigestUtils;

/**
 *
 * @author Gustavo Adolfo
 */
public class Validate {
    public String covertMD5 (String cadena){
        String crip = DigestUtils.md5Hex(cadena);
        return crip;
    }
}
