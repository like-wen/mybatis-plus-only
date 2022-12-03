package org.example;


import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

import javax.sql.DataSource;

import org.apache.ibatis.logging.stdout.StdOutImpl;
import org.apache.ibatis.mapping.Environment;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.transaction.TransactionFactory;
import org.apache.ibatis.transaction.jdbc.JdbcTransactionFactory;
import org.example.entity.User;
import org.example.mapper.UserMapper;
import org.springframework.jdbc.datasource.SimpleDriverDataSource;

import com.baomidou.mybatisplus.core.MybatisConfiguration;
import com.baomidou.mybatisplus.core.MybatisSqlSessionFactoryBuilder;


public class NoSpring {

    private static SqlSessionFactory sqlSessionFactory = initSqlSessionFactory();

    public static void main(String[] args) {

        //初始化
        try (SqlSession session = sqlSessionFactory.openSession(true)) {
            //创建mapper对象
            UserMapper mapper = session.getMapper(UserMapper.class);
            //创建user对象,并赋值
            User user = new User();
            user.setPassword("123");
            user.setName("lkw");
            //插入
            mapper.insert(user);
            System.out.println("结果: " + mapper.selectById(user.getId()));
        }
    }

    //工厂方法
    public static SqlSessionFactory initSqlSessionFactory() {
        DataSource dataSource = dataSource();
        TransactionFactory transactionFactory = new JdbcTransactionFactory();
        Environment environment = new Environment("Production", transactionFactory, dataSource);
        MybatisConfiguration configuration = new MybatisConfiguration(environment);
        configuration.addMapper(UserMapper.class);
        configuration.setLogImpl(StdOutImpl.class);
        return new MybatisSqlSessionFactoryBuilder().build(configuration);
    }

    //连接进行
    public static DataSource dataSource() {
        SimpleDriverDataSource dataSource = new SimpleDriverDataSource();
        dataSource.setDriverClass(com.mysql.cj.jdbc.Driver.class);
        dataSource.setUrl("jdbc:mysql://localhost:3306/course?serverTimezone=GMT%2B8");
        dataSource.setUsername("root");
        dataSource.setPassword("148963");
        return dataSource;
    }





}