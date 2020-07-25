package com.bihell.dice.service.task;

import com.bihell.dice.model.dto.QuartzJob;
import com.bihell.dice.model.tool.Task;
import org.quartz.SchedulerException;

import java.util.List;

/**
 * @author haseochen
 */
public interface JobService {

    /**
     * @return
     */
    List<QuartzJob> getTaskList();

    /**
     * 添加任务
     *
     * @param job
     * @throws SchedulerException
     */
    boolean addJob(QuartzJob job) throws SchedulerException;

    QuartzJob getJob(Task task);

    QuartzJob getJob(String jobName, String jobGroup) throws SchedulerException;

    boolean deleteJob(QuartzJob job);
}
