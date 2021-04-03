package ${package.Service};

import ${package.Entity}.${entity};
import ${superServiceClassPackage};
import com.baomidou.mybatisplus.core.metadata.IPage;
import ${cfg.dtoPackage}.${entity}DTO;
import ${cfg.dtoPackage}.${entity}DeleteDTO;
import ${cfg.queryPackage}.${entity}QueryParam;
import ${cfg.voPackage}.${entity}VO;
import java.util.List;

/**
* <p>
    * ${table.comment!} 服务类
    * </p>
*
* @author ${author}
* @since ${date}
*/
<#if kotlin>
    interface ${table.serviceName} : ${superServiceClass}<${entity}>
<#else>
public interface ${table.serviceName} extends ${superServiceClass}<${entity}> {
    /**
    *添加${table.comment!}
    */
    Boolean save${entity}(${entity}DTO ${entity?uncap_first}DTO);
    /**
    *更新${table.comment!}
    */
    Boolean update${entity}(${entity}DTO ${entity?uncap_first}DTO);
    /**
    *删除${table.comment!}
    */
    Boolean delete${entity}(Integer id);
    /**
    *查询${table.comment!}
    */
    IPage<${entity}VO> list${entity}(${entity}QueryParam queryParam);
    /**
    *批量删除${table.comment!}
    */
    Boolean delete${entity}Batch(List<Integer> ids);
    /**
    *导出${table.comment!}
    */
    List<${entity}VO> export${entity}(${entity}QueryParam queryParam);
}
</#if>
