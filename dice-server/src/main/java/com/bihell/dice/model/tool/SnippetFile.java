package com.bihell.dice.model.tool;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.extension.activerecord.Model;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.time.LocalDateTime;
import java.util.Date;

/**
 * 代码段文件
 *
 * @author haseochen
 */
@EqualsAndHashCode(callSuper = true)
@Data
@Accessors(chain = true)
public class SnippetFile extends Model<SnippetFile> {

    @TableId
    private Integer id;

    private String title;

    private String content;

    private String language;

    private Integer tabs;

    private Integer snippetId;

    private LocalDateTime createdAt;

    private LocalDateTime updatedAt;

    @TableField(exist = false)
    private Boolean destroy;
}
