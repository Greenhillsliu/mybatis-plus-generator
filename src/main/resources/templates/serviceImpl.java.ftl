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
import ${cfg.excelPackage}.${entity}VOListener;
import java.util.List;
import java.time.LocalDateTime;
import com.hfc.bonus.util.PageBuilder;
import org.springframework.web.multipart.MultipartFile;
import com.alibaba.excel.exception.ExcelAnalysisException;
import com.alibaba.excel.EasyExcel;
import com.hfc.bonus.converter.LocalDateTimeStringConverter;
import com.hfc.bonus.insert.AbstractNoahServiceImpl;

import java.io.IOException;

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
public class ${table.serviceImplName} extends AbstractNoahServiceImpl<${table.mapperName}, ${entity}> implements ${table.serviceName} {
    @Autowired
    private ${table.mapperName} ${table.mapperName?uncap_first};
    /**
    *添加${table.comment!}
    */
    @Override
    public Boolean save${entity}(${entity}DTO ${entity?uncap_first}DTO){
        ${entity} ${entity?uncap_first}=new ${entity}();
        BeanUtils.copyProperties(${entity?uncap_first}DTO,${entity?uncap_first});
        LocalDateTime date=LocalDateTime.now();
        ${entity?uncap_first}.setUpdateTime(date);
        ${entity?uncap_first}.setCreateTime(date);
        return save(${entity?uncap_first});
    }
    /**
    *更新${table.comment!}
    */
    @Override
    public Boolean update${entity}(${entity}DTO ${entity?uncap_first}DTO){
        ${entity} ${entity?uncap_first}=new ${entity}();
        BeanUtils.copyProperties(${entity?uncap_first}DTO,${entity?uncap_first});
        ${entity?uncap_first}.setUpdateTime(LocalDateTime.now());
        return updateById(${entity?uncap_first});
    }
    /**
    *删除${table.comment!}
    */
    @Override
    public Boolean delete${entity}(Integer id){
        return removeById(id);
    }
    /**
    *分页查询${table.comment!}
    */
    @Override
    public IPage<${entity}> list${entity}(${entity}QueryParam queryParam){
        LambdaQueryWrapper<${entity}> ${entity?uncap_first}Wrapper=getLambdaQueryWrapper(queryParam);
        IPage<${entity}> page = PageBuilder.buildPage(queryParam.getPage(),queryParam.getSize());
        return page(page,${entity?uncap_first}Wrapper);
    }
    /**
    *导出${table.comment!}
    */
    @Override
    public List<${entity}> export${entity}(${entity}QueryParam queryParam){
        LambdaQueryWrapper<${entity}> ${entity?uncap_first}Wrapper=getLambdaQueryWrapper(queryParam);
        return list(${entity?uncap_first}Wrapper);
    }
    /**
    *批量删除${table.comment!}
    */
    @Override
    public Boolean delete${entity}Batch(List<Integer> ids){
        return removeByIds(ids);
    }
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
    @Override
    public IPage<${entity}VO> list${entity}VO(${entity}QueryParam queryParam){
        LambdaQueryWrapper<${entity}> ${entity?uncap_first}Wrapper=getLambdaQueryWrapper(queryParam);
        IPage<${entity}VO> page = PageBuilder.buildPage(queryParam.getPage(),queryParam.getSize());
        return ${table.mapperName?uncap_first}.page(page,${entity?uncap_first}Wrapper);
        }
    /**
    *导出${table.comment!}VO
    */
    @Override
    public List<${entity}VO> export${entity}VO(${entity}QueryParam queryParam){
        LambdaQueryWrapper<${entity}> ${entity?uncap_first}Wrapper=getLambdaQueryWrapper(queryParam);
        return ${table.mapperName?uncap_first}.list(${entity?uncap_first}Wrapper);
    }
    /**
    *导入${table.comment!}VO
    */
    @Override
    public Boolean import${entity}VO(MultipartFile file){
        try {
            EasyExcel.read(file.getInputStream(),${entity}VO.class,
            new ${entity}VOListener(LocalDateTime.now(),this))
                .registerConverter(new LocalDateTimeStringConverter()).sheet().doRead();
        } catch (IOException | ExcelAnalysisException e) {
            e.printStackTrace();
            return Boolean.FALSE;
        }
        return Boolean.TRUE;
    }
}
</#if>
