package com.oto;

import com.baomidou.mybatisplus.core.toolkit.StringPool;
import com.baomidou.mybatisplus.generator.AutoGenerator;
import com.baomidou.mybatisplus.generator.InjectionConfig;
import com.baomidou.mybatisplus.generator.config.*;
import com.baomidou.mybatisplus.generator.config.po.TableInfo;
import com.baomidou.mybatisplus.generator.config.rules.NamingStrategy;
import com.baomidou.mybatisplus.generator.engine.FreemarkerTemplateEngine;
import com.baomidou.mybatisplus.generator.engine.VelocityTemplateEngine;
import org.apache.commons.lang3.StringUtils;

import java.sql.*;
import java.util.*;

// 演示例子，执行 main 方法控制台输入模块表名回车自动生成对应项目目录中
public class CodeGeneratorTest {
    //作者
    static final String author = "liu";
    //jdbc连接
    //jdbc连接
//    static final String dbUrl = "jdbc:mysql://139.159.225.21:3306/wms?useUnicode=true&characterEncoding=utf-8&zeroDateTimeBehavior=convertToNull&serverTimezone=Asia/Shanghai";
//    static final String dbUrl = "jdbc:mysql://125.91.109.80:7007/xbapp8dev?useUnicode=true&characterEncoding=utf-8&zeroDateTimeBehavior=convertToNull&serverTimezone=Asia/Shanghai";
//    static final String dbUrl = "jdbc:mysql://localhost:3306/node?useUnicode=true&characterEncoding=utf-8&zeroDateTimeBehavior=convertToNull&serverTimezone=Asia/Shanghai";
        static final String dbUrl = "jdbc:sqlserver://121.37.244.38:1433;DatabaseName=bonus";
    static final String dbDriver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
//    static final String dbDriver = "com.mysql.cj.jdbc.Driver";
    //用户名
//    static final String uname = "root";
        static final String uname = "sa";
    //密码
//    static final String pwd = "x5";
    static final String pwd = "By594bgsn.";
//    static final String pwd = "yld2020.";
//    static final String pwd = "root";
    //父包路径
    static final String parentPackage = "com.hfc";
    //模块名字 文件生成路径  父包+模块+ contrller/service/... +xxx.java
    static final String moduleName = "bonus";
    //表名字前缀 配置了就只生成 此前缀的表的代码
    static final String prefix="bonus";

    public static void main(String[] args) {

//        String[] strings1 = getStrings();
//        String[] strings1 = new String[]{"LIKP","LIPS"};
//        String[] strings1 = {"bonus_base_bonus"};
        String[] strings1 = {"bonus_calculate_record"
                ,"bonus_month_assess_msg"
                ,"bonus_month_post_record"
                ,"bonus_month_record"
                ,"bonus_person_post_assess_msg",
                "bonus_person_post_calculate_record","bonus_person_record"
                ,"bonus_person_record_assess_msg"
        };

        generate(strings1);

    }

    private static String[] getStrings() {
        List<String> strings=new ArrayList<>();
        ResultSet resultSet=null;
        Statement statement=null;
        Connection connection=null;
        try {
            Class.forName(dbDriver);
            connection = DriverManager.getConnection(dbUrl, uname, pwd);
            String sql=" show tables ";
            statement = connection.createStatement();
            resultSet = statement.executeQuery(sql);
            while (resultSet.next()) {
                if (StringUtils.isBlank(prefix)){
                    strings.add(StringUtils.trim(resultSet.getString(1)));
                }else {
                    if (StringUtils.startsWith(StringUtils.trim(resultSet.getString(1)),prefix)){
                        strings.add(StringUtils.trim(resultSet.getString(1)));
                    }
                }
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }finally {
            try {
                if (resultSet!=null){
                    resultSet.close();
                }
                if (statement!=null){
                    statement.close();
                }
                if (connection!=null){
                    connection.close();
                }
            } catch (SQLException throwable) {
                throwable.printStackTrace();
            }
        }
        String[] s1=new String[strings.size()];
        return strings.toArray(s1);
    }

    private static void generate(String[] s) {

        // 代码生成器
        AutoGenerator mpg = new AutoGenerator();

        // 全局配置
        GlobalConfig gc = new GlobalConfig();
        String projectPath = System.getProperty("user.dir");
        gc.setOutputDir(projectPath + "/src/main/java"); //输出 文件路径
        gc.setAuthor(author);
        gc.setOpen(false);
        gc.setBaseColumnList(true);
        gc.setSwagger2(true);
        gc.setBaseResultMap(true);


        mpg.setGlobalConfig(gc);

        // 数据源配置
        DataSourceConfig dsc = new DataSourceConfig();
        dsc.setUrl(dbUrl);
        // dsc.setSchemaName("public");
        dsc.setDriverName(dbDriver);
        dsc.setUsername(uname);
        dsc.setPassword(pwd);
        mpg.setDataSource(dsc);

        // 包配置
        PackageConfig pc = new PackageConfig();
        pc.setModuleName(moduleName);
        pc.setParent(parentPackage);
        pc.setXml("mapper.xml");
        mpg.setPackageInfo(pc);

        // 自定义配置
        InjectionConfig cfg = new InjectionConfig() {
            @Override
            public void initMap() {
                // to do nothing
                Map<String, Object> map = new HashMap<>();
                map.put("dtoPackage", parentPackage+"."+moduleName+".domain.dto");
                map.put("voPackage", parentPackage+"."+moduleName+".domain.vo");
                map.put("queryPackage", parentPackage+"."+moduleName+".domain.query");
                map.put("excelPackage", parentPackage+"."+moduleName+".excel");
                this.setMap(map);
            }
        };

        // 如果模板引擎是 freemarker
        String templatePath = "templates/entityDTO.java.ftl";
        // 如果模板引擎是 velocity
        // String templatePath = "/templates/mapper.xml.vm";

//        如果模板引擎是 beetl
//        String templatePath = "/templates/mapper.xml.vm";
        // 自定义输出配置
        List<FileOutConfig> focList = new ArrayList<>();


        // 自定义配置会被优先输出
        focList.add(new FileOutConfig("/templates/entityDTO.java.ftl") {
            @Override
            public String outputFile(TableInfo tableInfo) {
//                // 自定义输出文件名 ， 如果你 Entity 设置了前后缀、此处注意 xml 的名称会跟着发生变化！！
                return projectPath + "/src/main/java/" + parentPackage.replace(".","/")+"/"+moduleName+"/domain/dto"
                        + "/" + tableInfo.getEntityName() + "DTO.java";
            }
        });
        focList.add(new FileOutConfig("/templates/entityVO.java.ftl") {
            @Override
            public String outputFile(TableInfo tableInfo) {
//                // 自定义输出文件名 ， 如果你 Entity 设置了前后缀、此处注意 xml 的名称会跟着发生变化！！
                return projectPath + "/src/main/java/" + parentPackage.replace(".","/")+"/"+moduleName+"/domain/vo"
                        + "/" + tableInfo.getEntityName() + "VO.java";
            }
        });
        focList.add(new FileOutConfig("/templates/entityDeleteDTO.java.ftl") {
            @Override
            public String outputFile(TableInfo tableInfo) {
//                // 自定义输出文件名 ， 如果你 Entity 设置了前后缀、此处注意 xml 的名称会跟着发生变化！！
                return projectPath + "/src/main/java/" + parentPackage.replace(".","/")+"/"+moduleName+"/domain/dto"
                        + "/" + tableInfo.getEntityName() + "DeleteDTO.java";
            }
        });
        focList.add(new FileOutConfig("/templates/entityQueryParam.java.ftl") {
            @Override
            public String outputFile(TableInfo tableInfo) {
//                // 自定义输出文件名 ， 如果你 Entity 设置了前后缀、此处注意 xml 的名称会跟着发生变化！！
                return projectPath + "/src/main/java/" + parentPackage.replace(".","/")+"/"+moduleName+"/domain/query"
                        + "/" + tableInfo.getEntityName() + "QueryParam.java";
            }
        });

        focList.add(new FileOutConfig("/templates/excel.java.ftl") {
            @Override
            public String outputFile(TableInfo tableInfo) {
//                // 自定义输出文件名 ， 如果你 Entity 设置了前后缀、此处注意 xml 的名称会跟着发生变化！！
                return projectPath + "/src/main/java/" + parentPackage.replace(".","/")+"/"+moduleName+"/excel"
                        + "/" + tableInfo.getEntityName() + "VOListener.java";
            }
        });


   /*     focList.add(new FileOutConfig("/templates/page_info.js.btl") {
            @Override
            public String outputFile(TableInfo tableInfo) {
//                // 自定义输出文件名 ， 如果你 Entity 设置了前后缀、此处注意 xml 的名称会跟着发生变化！！
                return projectPath + "/src/main/resources/web/" + pc.getModuleName()
                        + "/" + tableInfo.getEntityName() + ".js";
            }
        });*/

        cfg.setFileOutConfigList(focList);
        mpg.setCfg(cfg);

        // 配置模板
        TemplateConfig templateConfig = new TemplateConfig();
//        // 配置自定义输出模板
//        //指定自定义模板路径，注意不要带上.ftl/.vm, 会根据使用的模板引擎自动识别
        templateConfig.setEntity("templates/entity.java");
        templateConfig.setService("templates/service.java");
        templateConfig.setController("templates/controller.java");
        templateConfig.setXml("templates/mapper.xml");
        templateConfig.setMapper("templates/mapper.java");
        templateConfig.setServiceImpl("templates/serviceImpl.java");
        mpg.setTemplate(templateConfig);

        // 策略配置
        StrategyConfig strategy = new StrategyConfig();
        strategy.setNaming(NamingStrategy.underline_to_camel);
        strategy.setColumnNaming(NamingStrategy.underline_to_camel);
//        strategy.setSuperEntityClass("");
        strategy.setEntityLombokModel(true);

//        strategy.setTablePrefix("bonus_");
        strategy.setSkipView(true);
        strategy.setEntityBooleanColumnRemoveIsPrefix(true);
        strategy.setEntityTableFieldAnnotationEnable(true);
        strategy.setEntityBooleanColumnRemoveIsPrefix(true);
        strategy.setRestControllerStyle(true);

//        strategy.setSuperControllerClass("");
        //如果只生成一个表 需要把s替换成tableName
//        String tableName="";
//        strategy.setInclude(tableName);

        strategy.setInclude(s);
//        strategy.setSuperEntityColumns("id");
        strategy.setControllerMappingHyphenStyle(true);
        strategy.setTablePrefix(pc.getModuleName() + "_");
        mpg.setStrategy(strategy);
//        mpg.setTemplateEngine(new FreemarkerTemplateEngine());
        mpg.setTemplateEngine(new FreemarkerTemplateEngine());

        mpg.execute();
    }
}