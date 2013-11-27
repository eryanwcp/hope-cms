package org.lework.core.common;

import org.lework.runner.utils.PropertiesLoader;

/**
 * Web Application  Configurate Constant
 * User: Gongle
 * Date: 13-9-22
 */
public class AppConfigConstant {
    public static PropertiesLoader LOADER;

    static {
        LOADER = new PropertiesLoader("appConfigConstant.properties");
        runtimeEnv = RuntimeEnv.valueOf(LOADER.getProperty(Keys.runtimeEnv));
    }

    /**
     * 属性会在Spring启动的时候根据appConfig.properties计算出来。
     * #ResourcePathExposer
     */
    public static String CTX;
    /**
     * 属性会在Spring启动的时候根据appConfig.properties计算出来。
     * #ResourcePathExposer
     */
    public static String SRC;

    /**
     * Wher  runs on?.
     */
    private static RuntimeEnv runtimeEnv;

    /**
     * Which mode  runs in?
     */
    private static RuntimeMode runtimeMode;

    private static class Keys {

        public static final String runtimeEnv = "runtimeEnv";

    }
}
