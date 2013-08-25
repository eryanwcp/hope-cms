package org.hope.web;

import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import freemarker.template.Configuration;
import freemarker.template.Template;
import org.junit.Test;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import static org.junit.Assert.assertEquals;

public class FreemarkersTest {
    private final String TEMPLATE = "hello ${userName}";
    private final String ERROR_TEMPLATE = "hello ${";

    @Test
    public void renderString() {
        Map<String, String> model = Maps.newHashMap();
        model.put("userName", "calvin");
        String result = FreeMarkers.renderString(TEMPLATE, model);
        assertEquals("hello calvin", result);
    }

    @Test
    public void renderString2() {
        Map<String, Object> model = Maps.newHashMap();

        List<String> friends = Lists.newArrayList("a", "b", "c");

        model.put("friends", friends);
        String result = FreeMarkers.renderString("hello ${friends[0]}", model);
        assertEquals("hello a", result);
    }

    @Test(expected = RuntimeException.class)
    public void renderStringWithErrorTemplate() {
        Map<String, String> model = Maps.newHashMap();
        model.put("userName", "calvin");
        FreeMarkers.renderString(ERROR_TEMPLATE, model);
    }

    @Test
    public void renderFile() throws IOException {
        Map<String, String> model = Maps.newHashMap();
        model.put("userName", "calvin");
        Configuration cfg = FreeMarkers.buildConfiguration("classpath:/");
        Template template = cfg.getTemplate("testTemplate.ftl");
        String result = FreeMarkers.renderTemplate(template, model);
        assertEquals("hello calvin", result);
    }
}
