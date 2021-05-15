package ${package.Mapper};

import ${package.Entity}.${entity};
import ${superMapperClassPackage};
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.Constants;
import org.apache.ibatis.annotations.Param;
import com.baomidou.mybatisplus.core.conditions.Wrapper;
import ${cfg.voPackage}.${entity}VO;
import java.util.List;
import org.springframework.stereotype.Repository;


/**
 * <p>
 * ${table.comment!} Mapper 接口
 * </p>
 *
 * @author ${author}
 * @since ${date}
 */
<#if kotlin>
interface ${table.mapperName} : ${superMapperClass}<${entity}>
<#else>
@Repository
public interface ${table.mapperName} extends ${superMapperClass}<${entity}> {

   IPage<${entity}VO> page(IPage<${entity}VO> page, @Param(Constants.WRAPPER)Wrapper<${entity}> wrapper);

   List<${entity}VO> list(@Param(Constants.WRAPPER)Wrapper<${entity}> wrapper);
}
</#if>
