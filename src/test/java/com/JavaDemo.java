package com;

import java.lang.management.ManagementFactory;
import java.lang.management.MemoryMXBean;
import java.text.DecimalFormat;
import java.util.HashMap;
import java.util.Map;

public class JavaDemo {

    public Map<String, Object> doWork(String fromJs) {
        Map<String, Object> map = new HashMap<>();
        map.put("someKey", new HashMap<String, Object>(){});
        return map;
    }

    public static void printJVMStats() {
        try {
            DecimalFormat df = new DecimalFormat();
            df.setMaximumFractionDigits(2);
            MemoryMXBean memoryMXBean = ManagementFactory.getMemoryMXBean();
            System.out.printf("#STATS | Initial memory: %s GB | Used heap memory: %s GB | Max heap memory: %s GB | Committed memory: %s GB%n",
                    df.format((double) memoryMXBean.getHeapMemoryUsage().getInit() / 1073741824),
                    df.format((double) memoryMXBean.getHeapMemoryUsage().getUsed() / 1073741824),
                    df.format((double) memoryMXBean.getHeapMemoryUsage().getMax() / 1073741824),
                    df.format((double) memoryMXBean.getHeapMemoryUsage().getCommitted() / 1073741824));
            System.out.println("==================================================================================================================");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}