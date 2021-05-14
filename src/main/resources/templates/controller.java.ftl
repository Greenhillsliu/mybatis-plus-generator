package ${package.Controller};


import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import com.baomidou.mybatisplus.core.metadata.IPage;
import ${cfg.dtoPackage}.${entity}DTO;
import ${cfg.dtoPackage}.${entity}DeleteDTO;
import ${cfg.queryPackage}.${entity}QueryParam;
import ${cfg.voPackage}.${entity}VO;
import ${package.Service}.${table.serviceName};
import ${package.Entity}.${entity};
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletResponse;
<#if restControllerStyle>
import org.springframework.web.bind.annotation.RestController;
<#else>
import org.springframework.stereotype.Controller;
</#if>
<#if superControllerClassPackage??>
import ${superControllerClassPackage};
</#if>

/**
* <p>
    * ${table.comment!} 前端控制器
    * </p>
*
* @author ${author}
* @since ${date}
*/
<#if restControllerStyle>
    @RestController
<#else>
    @Controller
</#if>
@RequestMapping("<#if package.ModuleName??>/${package.ModuleName}</#if>/<#if controllerMappingHyphenStyle??>${controllerMappingHyphen}<#else>${table.entityPath}</#if>")
<#if kotlin>
public class ${table.controllerName}<#if superControllerClass??> : ${superControllerClass}()</#if>
<#else>
    <#if superControllerClass??>
public class ${table.controllerName} extends ${superControllerClass} {
    <#else>
public class ${table.controllerName} {
    </#if>
    @Autowired
    private ${table.serviceName}  ${table.serviceName?uncap_first} ;

    /**
    *添加${table.comment!}
    */
    @ApiOperation("添加${table.comment!}")
    @PostMapping("add")
    public CommonResult<Boolean> save${entity}(@RequestBody @Validated({InsertGroup.class}) ${entity}DTO ${entity?uncap_first}DTO) {
        return CommonResult.success(${table.serviceName?uncap_first}.save${entity}(${entity?uncap_first}DTO));
    }
    /**
    *更新${table.comment!}
    */
    @ApiOperation("更新${table.comment!}")
    @PostMapping("update")
    public CommonResult<Boolean> update${entity}(@RequestBody @Validated({UpdateGroup.class}) ${entity}DTO ${entity?uncap_first}DTO) {
        return CommonResult.success(${table.serviceName?uncap_first}.update${entity}(${entity?uncap_first}DTO));
    }
    /**
    *删除${table.comment!}
    */
    @ApiOperation("删除${table.comment!}")
    @PostMapping("delete")
    public CommonResult<Boolean> delete${entity}(@RequestBody @Validated ${entity}DeleteDTO deleteDTO) {
        return CommonResult.success(${table.serviceName?uncap_first}.delete${entity}(deleteDTO.getIds().get(0)));
    }

    /**
    *批量删除${table.comment!}
    */
    @ApiOperation("批量删除${table.comment!}")
    @PostMapping("delete-batch")
    public CommonResult<Boolean> delete${entity}Batch(@RequestBody @Validated ${entity}DeleteDTO deleteDTO) {
        return CommonResult.success(${table.serviceName?uncap_first}.delete${entity}Batch(deleteDTO.getIds()));
    }
    /**
    *导出${table.comment!}VO
    */
    @ApiOperation("导出${table.comment!}VO")
    @PostMapping("export-vo")
    public void export${entity}VO(@RequestBody  ${entity}QueryParam queryParam, HttpServletResponse response) {
        List<${entity}VO> ${entity}s = ${table.serviceName?uncap_first}.export${entity}VO(queryParam);
        if (CollectionUtil.isEmpty(${entity}s )) {
            ${entity}s = new ArrayList<>();
        }
        ExcelExportUtil.exportResponse(response,${entity}s,"${table.comment!}",${entity}VO.class);
    }
    /**
    *查询${table.comment!}VO
    */
    @ApiOperation("查询${table.comment!}VO")
    @PostMapping("list-vo")
    public CommonResult<IPage<${entity}VO>> list${entity}VO(@RequestBody  ${entity}QueryParam queryParam) {
        return CommonResult.success(${table.serviceName?uncap_first}.list${entity}VO(queryParam));
    }
    /**
    *导出${table.comment!}
    */
    @ApiOperation("导出${table.comment!}")
    @PostMapping("export")
    public void export${entity}(@RequestBody  ${entity}QueryParam queryParam, HttpServletResponse response) {
    List<${entity}> ${entity}s = ${table.serviceName?uncap_first}.export${entity}(queryParam);
        if (CollectionUtil.isEmpty(${entity}s)) {
            ${entity}s = new ArrayList<>();
        }
        ExcelExportUtil.exportResponse(response,${entity}s,"${table.comment!}",${entity}.class);
    }
    /**
    *查询${table.comment!}
    */
    @ApiOperation("查询${table.comment!}")
    @PostMapping("list")
    public CommonResult<IPage<${entity}>> list${entity}(@RequestBody  ${entity}QueryParam queryParam) {
        return CommonResult.success(${table.serviceName?uncap_first}.list${entity}(queryParam));
    }
}
</#if>
