package ${package.Service};

import ${package.Entity}.${entity};
import ${cfg.voPackage}.${entity}VO;
import ${superServiceClassPackage};
import com.baomidou.mybatisplus.core.metadata.IPage;
import ${cfg.dtoPackage}.${entity}DTO;
import ${cfg.dtoPackage}.${entity}DeleteDTO;
import ${cfg.queryPackage}.${entity}QueryParam;
import java.util.List;
import org.springframework.web.multipart.MultipartFile;

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
    *查询${table.comment!}VO
    */
    IPage<${entity}VO> list${entity}VO(${entity}QueryParam queryParam);
    /**
    *批量删除${table.comment!}
    */
    Boolean delete${entity}Batch(List<Integer> ids);
    /**
    *导出${table.comment!}VO
    */
    List<${entity}VO> export${entity}VO(${entity}QueryParam queryParam);

    /**
    *分页查询${table.comment!}
    */
    IPage<${entity}> list${entity}(${entity}QueryParam queryParam);
    /**
    *导出${table.comment!}
    */
    List<${entity}> export${entity}(${entity}QueryParam queryParam);
    /**
    *导入${table.comment!}VO
    */
    Boolean import${entity}VO(MultipartFile file);
}
</#if>
