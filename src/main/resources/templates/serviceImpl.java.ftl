package ${package.ServiceImpl};

import ${package.Entity}.${entity};
import ${package.Mapper}.${table.mapperName};
import ${package.Service}.${table.serviceName};
import ${superServiceImplClassPackage};
import org.springframework.stereotype.Service;
import org.springframework.beans.BeanUtils;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import org.springframework.beans.factory.annotation.Autowired;
import ${cfg.dtoPackage}.${entity}DTO;
import ${cfg.dtoPackage}.${entity}DeleteDTO;
import ${cfg.queryPackage}.${entity}QueryParam;
import ${cfg.voPackage}.${entity}VO;
import java.util.List;

/**
 * <p>
 * ${table.comment!} 服务实现类
 * </p>
 *
 * @author ${author}
 * @since ${date}
 */
@Service
<#if kotlin>
open class ${table.serviceImplName} : ${superServiceImplClass}<${table.mapperName}, ${entity}>(), ${table.serviceName} {

}
<#else>
public class ${table.serviceImplName} extends ${superServiceImplClass}<${table.mapperName}, ${entity}> implements ${table.serviceName} {
    @Autowired
    private ${table.mapperName} ${table.mapperName?uncap_first};
    /**
    *添加${table.comment!}
    */
    public Boolean save${entity}(${entity}DTO ${entity?uncap_first}DTO){
        ${entity} ${entity?uncap_first}=new ${entity}();
        BeanUtils.copyProperties(${entity?uncap_first}DTO,${entity?uncap_first});
        return save(${entity?uncap_first});
    };
    /**
    *更新${table.comment!}
    */
    public Boolean update${entity}(${entity}DTO ${entity?uncap_first}DTO){
        ${entity} ${entity?uncap_first}=new ${entity}();
        BeanUtils.copyProperties(${entity?uncap_first}DTO,${entity?uncap_first});
        return updateById(${entity?uncap_first});
    };
    /**
    *删除${table.comment!}
    */
    public Boolean delete${entity}(Integer id){
        return removeById(id);
    };
    /**
    *分页查询${table.comment!}
    */
    public IPage<${entity}> list${entity}(${entity}QueryParam queryParam){
        LambdaQueryWrapper<${entity}> ${entity?uncap_first}Wrapper=getLambdaQueryWrapper(queryParam);
        IPage<${entity}> page = PageBuilder.buildPage(queryParam.getPage(),queryParam.getSize());
        return page(page,${entity?uncap_first}Wrapper);
    };
    /**
    *导出${table.comment!}
    */
    public List<${entity}> export${entity}(${entity}QueryParam queryParam){
        LambdaQueryWrapper<${entity}> ${entity?uncap_first}Wrapper=getLambdaQueryWrapper(queryParam);
        return list(${entity?uncap_first}Wrapper);
    };
    /**
    *批量删除${table.comment!}
    */
    public Boolean delete${entity}Batch(List<Integer> ids){
        return removeByIds(ids);
    };
    /**
    * lambda查询条件封装
    */
    public LambdaQueryWrapper<${entity}> getLambdaQueryWrapper(${entity}QueryParam queryParam){
        return new LambdaQueryWrapper<${entity}>();
    }
    /**
    * 普通查询条件封装
    */
    public QueryWrapper<${entity}> getQueryWrapper(${entity}QueryParam queryParam){
    return new QueryWrapper<${entity}>();
    }
    /**
    *分页查询${table.comment!}VO
    */
    public IPage<${entity}VO> list${entity}VO(${entity}QueryParam queryParam){
        LambdaQueryWrapper<${entity}> ${entity?uncap_first}Wrapper=getLambdaQueryWrapper(queryParam);
        IPage<${entity}VO> page = PageBuilder.buildPage(queryParam.getPage(),queryParam.getSize());
        return ${table.mapperName?uncap_first}.page(page,${entity?uncap_first}Wrapper);
        };
    /**
    *导出${table.comment!}VO
    */
    public List<${entity}VO> export${entity}VO(${entity}QueryParam queryParam){
        LambdaQueryWrapper<${entity}> ${entity?uncap_first}Wrapper=getLambdaQueryWrapper(queryParam);
        return ${table.mapperName?uncap_first}.list(${entity?uncap_first}Wrapper);
    };

}
</#if>
