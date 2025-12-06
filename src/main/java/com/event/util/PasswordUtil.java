package com.event.util;

import java.security.MessageDigest;
import java.security.SecureRandom;
import java.util.Base64;

public class PasswordUtil {
    public static String hash(String password, String salt) throws Exception {
        MessageDigest md = MessageDigest.getInstance("SHA-256");
        md.update(salt.getBytes("UTF-8"));
        byte[] hashed = md.digest(password.getBytes("UTF-8"));
        return Base64.getEncoder().encodeToString(hashed);
    }

    public static String generateSalt() {
        SecureRandom sr = new SecureRandom();
        byte[] salt = new byte[16];
        sr.nextBytes(salt);
        return Base64.getEncoder().encodeToString(salt);
    }
}
