package ${cfg.excelPackage};

import java.time.LocalDateTime;
import ${package.Entity}.${entity};
import ${cfg.voPackage}.${entity}VO;
import com.alibaba.excel.context.AnalysisContext;
import com.alibaba.excel.event.AnalysisEventListener;
import lombok.extern.slf4j.Slf4j;
import ${package.Service}.${table.serviceName};
import cn.hutool.core.bean.BeanUtil;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * <p>
 * ${table.comment!}导入
 * </p>
 *
 * @author ${author}
 * @since ${date}
 */

@Slf4j
public class ${entity}VOListener extends AnalysisEventListener<${entity}VO> {
    /**
    * 每隔5条存储数据库，实际使用中可以3000条，然后清理list ，方便内存回收
    */
    private static final int BATCH_COUNT = 3000;
    List<${entity}> list = new ArrayList<>();
    /**
    * 假设这个是一个DAO，当然有业务逻辑这个也可以是一个service。当然如果不用存储这个对象没用。
    */
    private LocalDateTime date;
    private ${table.serviceName} ${table.serviceName?uncap_first};

    public ${entity}VOListener() {
    }

    /**
    * 如果使用了spring,请使用这个构造方法。每次创建Listener的时候需要把spring管理的类传进来
    */
    public ${entity}VOListener(LocalDateTime date,${table.serviceName} ${table.serviceName?uncap_first}) {
        this.${table.serviceName?uncap_first} = ${table.serviceName?uncap_first};
        this.date = date;
    }

    /**
    * 这个每一条数据解析都会来调用
    *
    * @param data    one row value. Is is same as {@link AnalysisContext#readRowHolder()}
    * @param context
    */
    @Override
    public void invoke(${entity}VO data, AnalysisContext context) {
        ${entity} ${entity?cap_first}=new ${entity}();
        BeanUtil.copyProperties(data,${entity?cap_first});
        ${entity?cap_first}.setCreateTime(date);
        ${entity?cap_first}.setUpdateTime(date);
        list.add(${entity?cap_first});
        if(list.size()>3000){
            ${table.serviceName?uncap_first}.saveBatch(list);
            list.clear();
        }
    }

    /**
    * 所有数据解析完成了 都会来调用
    *
    * @param context
    */
    @Override
    public void doAfterAllAnalysed(AnalysisContext context) {
    // 这里也要保存数据，确保最后遗留的数据也存储到数据库
    if (list.size()>0){
        ${table.serviceName?uncap_first}.saveBatch(list);
    }
        log.info("所有数据解析完成！");
    }

    /**
    * 加上存储数据库
    */
    private void saveData() {
        log.info("{}条数据，开始存储数据库！", list.size());
    }
}