package ${cfg.dtoPackage};


<#if swagger2>
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
</#if>
<#if entityLombokModel>
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;
</#if>
import javax.validation.constraints.NotEmpty;
import java.io.Serializable;
import java.util.List;
/**
 * <p>
 * ${table.comment!}删除dto
 * </p>
 *
 * @author ${author}
 * @since ${date}
 */
<#if entityLombokModel>
@Data
    <#if superEntityClass??>
@EqualsAndHashCode(callSuper = true)
    <#else>
@EqualsAndHashCode(callSuper = false)
    </#if>
@Accessors(chain = true)
</#if>
<#if swagger2>
@ApiModel(value="${entity}删除模型", description="${table.comment!}")
</#if>
public class ${entity}DeleteDTO implements Serializable {
    private static final long serialVersionUID = 1L;
    @NotEmpty(message = "id不能为空")
    @ApiModelProperty("主键id集合")
    private List<Integer> ids;
}