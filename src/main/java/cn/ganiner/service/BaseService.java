package cn.ganiner.service;

import java.util.List;

public interface BaseService<T> {

    /**
     * 查询所有
     *
     * @return
     */
    List<T> findAll();

    /**
     * 根据ID查询
     *
     * @param id
     * @return
     */
    /**
     * 添加
     *
     * @param t
     */
    void create(T t);
    /**
     * 删除（批量）
     *
     * @param id
     */
    void delete(Long id);
    /**
     * 修改
     *
     * @param t
     */
    void update(T t);
}