# 生活服务分类表
CREATE TABLE `o2o_category`
(
    `id`          INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
    `name`        VARCHAR(50)      NOT NULL DEFAULT '',
    `parent_id`   int(10) UNSIGNED NOT NULL DEFAULT 0,
    `list_order`  INT(8) UNSIGNED  NOT NULL DEFAULT 0,
    `status`      TINYINT(1)       NOT NULL DEFAULT 0,
    `create_time` INT(11) UNSIGNED NOT NULL DEFAULT 0,
    `update_time` INT(11) UNSIGNED NOT NULL DEFAULT 0,
    PRIMARY KEY (`id`),
    KEY parent_id (`parent_id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  DEFAULT CHARSET = utf8;

# 城市表
CREATE TABLE `o2o_city`
(
    `id`          INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
    `name`        VARCHAR(50)      NOT NULL DEFAULT '',
    `u_name`      VARCHAR(50)      NOT NULL DEFAULT '',
    `parent_id`   int(10) UNSIGNED NOT NULL DEFAULT 0,
    `list_order`  INT(8) UNSIGNED  NOT NULL DEFAULT 0,
    `status`      TINYINT(1)       NOT NULL DEFAULT 0,
    `create_time` INT(11) UNSIGNED NOT NULL DEFAULT 0,
    `update_time` INT(11) UNSIGNED NOT NULL DEFAULT 0,
    PRIMARY KEY (`id`),
    KEY parent_id (`parent_id`),
    UNIQUE KEY u_name (`u_name`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  DEFAULT CHARSET = utf8;

# 商圈表
CREATE TABLE `o2o_area`
(
    `id`          INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
    `name`        VARCHAR(50)      NOT NULL DEFAULT '',
    `city_id`     INT(11) UNSIGNED NOT NULL DEFAULT 0,
    `parent_id`   int(10) UNSIGNED NOT NULL DEFAULT 0,
    `list_order`  INT(8) UNSIGNED  NOT NULL DEFAULT 0,
    `status`      TINYINT(1)       NOT NULL DEFAULT 0,
    `create_time` INT(11) UNSIGNED NOT NULL DEFAULT 0,
    `update_time` INT(11) UNSIGNED NOT NULL DEFAULT 0,
    PRIMARY KEY (`id`),
    KEY parent_id (`parent_id`),
    KEY city_id (`city_id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  DEFAULT CHARSET = utf8;

# 商户表
CREATE TABLE `o2o_bis`
(
    `id`           INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
    `name`         VARCHAR(50)      NOT NULL DEFAULT '',
    `email`        VARCHAR(50)      NOT NULL DEFAULT '',
    `logo`         VARCHAR(255)     NOT NULL DEFAULT '',
    `license_logo` VARCHAR(255)     NOT NULL DEFAULT '',
    `description`  TEXT             NOT NULL,
    `city_id`      INT(11) UNSIGNED NOT NULL DEFAULT 0,
    `city_path`    VARCHAR(50)      NOT NULL DEFAULT '',
    `bank_info`    VARCHAR(50)      NOT NULL DEFAULT '',
    `money`        DECIMAL(20, 2)   NOT NULL DEFAULT '0.00',
    `bank_name`    VARCHAR(50)      NOT NULL DEFAULT '',
    `bank_user`    VARCHAR(50)      NOT NULL DEFAULT '',
    `faren`        VARCHAR(20)      NOT NULL DEFAULT '',
    `faren_tel`    VARCHAR(20)      NOT NULL DEFAULT '',
    `list_order`   INT(8) UNSIGNED  NOT NULL DEFAULT 0,
    `status`       TINYINT(1)       NOT NULL DEFAULT 0,
    `create_time`  INT(11) UNSIGNED NOT NULL DEFAULT 0,
    `update_time`  INT(11) UNSIGNED NOT NULL DEFAULT 0,
    PRIMARY KEY (`id`),
    KEY city_id (`city_id`),
    KEY name (`name`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  DEFAULT CHARSET = utf8;

# 商户账号表
CREATE TABLE `o2o_bis_account`
(
    `id`              INT(11) UNSIGNED    NOT NULL AUTO_INCREMENT,
    `username`        VARCHAR(50)         NOT NULL DEFAULT '',
    `password`        CHAR(32)            NOT NULL DEFAULT '',
    `code`            VARCHAR(10)         NOT NULL DEFAULT '',
    `bis_id`          INT(11) UNSIGNED    NOT NULL DEFAULT 0,
    `last_login_ip`   VARCHAR(20)         NOT NULL DEFAULT '',
    `last_login_time` INT(11) UNSIGNED    NOT NULL DEFAULT 0,
    `is_main`         TINYINT(1) UNSIGNED NOT NULL DEFAULT 0,
    `list_order`      INT(8) UNSIGNED     NOT NULL DEFAULT 0,
    `status`          TINYINT(1)          NOT NULL DEFAULT 0,
    `create_time`     INT(11) UNSIGNED    NOT NULL DEFAULT 0,
    `update_time`     INT(11) UNSIGNED    NOT NULL DEFAULT 0,
    PRIMARY KEY (`id`),
    KEY bis_id (`bis_id`),
    KEY username (`username`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  DEFAULT CHARSET = utf8;

# 商户门店表
CREATE TABLE `o2o_bis_location`
(
    `id`            INT(11) UNSIGNED    NOT NULL AUTO_INCREMENT,
    `name`          VARCHAR(50)         NOT NULL DEFAULT '',
    `logo`          VARCHAR(255)        NOT NULL DEFAULT '',
    `address`       VARCHAR(255)        NOT NULL DEFAULT '',
    `tel`           VARCHAR(20)         NOT NULL DEFAULT '',
    `contact`       VARCHAR(20)         NOT NULL DEFAULT '',
    `xpoint`        VARCHAR(20)         NOT NULL DEFAULT '',
    `ypoint`        VARCHAR(20)         NOT NULL DEFAULT '',
    `bis_id`        INT(11) UNSIGNED    NOT NULL DEFAULT 0,
    `open_time`     INT(11) UNSIGNED    NOT NULL DEFAULT 0,
    `content`       TEXT                NOT NULL,
    `is_main`       TINYINT(1) UNSIGNED NOT NULL DEFAULT 0,
    `api_address`   VARCHAR(255)        NOT NULL DEFAULT '',
    `city_id`       INT(11) UNSIGNED    NOT NULL DEFAULT 0,
    `city_path`     VARCHAR(50)         NOT NULL DEFAULT '',
    `category_id`   INT(11) UNSIGNED    NOT NULL DEFAULT 0,
    `category_path` VARCHAR(50)         NOT NULL DEFAULT '',
    `bank_info`     VARCHAR(50)         NOT NULL DEFAULT '',
    `list_order`    INT(8) UNSIGNED     NOT NULL DEFAULT 0,
    `status`        TINYINT(1)          NOT NULL DEFAULT 0,
    `create_time`   INT(11) UNSIGNED    NOT NULL DEFAULT 0,
    `update_time`   INT(11) UNSIGNED    NOT NULL DEFAULT 0,
    PRIMARY KEY (`id`),
    KEY city_id (`city_id`),
    KEY bis_id (`bis_id`),
    KEY category_id (`category_id`),
    KEY name (`name`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  DEFAULT CHARSET = utf8;

# 团购商品表
CREATE TABLE `o2o_deal`
(
    `id`                 INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
    `name`               VARCHAR(100)     NOT NULL DEFAULT '',
    `category_id`        INT(11) UNSIGNED NOT NULL DEFAULT 0,
    `se_category`        INT(11) UNSIGNED NOT NULL DEFAULT 0,
    `bis_id`             INT(11) UNSIGNED NOT NULL DEFAULT 0,
    `lacation_ids`       VARCHAR(100)     NOT NULL DEFAULT '',
    `image`              VARCHAR(200)     NOT NULL DEFAULT '',
    `description`        TEXT             NOT NULL,
    `start_time`         INT(11) UNSIGNED NOT NULL DEFAULT 0,
    `end_time`           INT(11) UNSIGNED NOT NULL DEFAULT 0,
    `origin_price`       DECIMAL(20, 2)   NOT NULL DEFAULT '0.00',
    `current_price`      DECIMAL(20, 2)   NOT NULL DEFAULT '0.00',
    `city_id`            INT(11) UNSIGNED NOT NULL DEFAULT 0,
    `buy_count`          INT(11) UNSIGNED NOT NULL DEFAULT 0,
    `total_count`        INT(11) UNSIGNED NOT NULL DEFAULT 0,
    `coupons_begin_time` INT(11) UNSIGNED NOT NULL DEFAULT 0,
    `coupons_end_time`   INT(11) UNSIGNED NOT NULL DEFAULT 0,
    `xpoint`             VARCHAR(20)      NOT NULL DEFAULT '',
    `ypoint`             VARCHAR(20)      NOT NULL DEFAULT '',
    `bis_account_id`     INT(11) UNSIGNED NOT NULL DEFAULT 0,
    `balance_price`      DECIMAL(20, 2)   NOT NULL DEFAULT '0.00',
    `notes`              TEXT             NOT NULL,
    `list_order`         INT(8) UNSIGNED  NOT NULL DEFAULT 0,
    `status`             TINYINT(1)       NOT NULL DEFAULT 0,
    `create_time`        INT(11) UNSIGNED NOT NULL DEFAULT 0,
    `update_time`        INT(11) UNSIGNED NOT NULL DEFAULT 0,
    PRIMARY KEY id (`id`),
    KEY category_id (`category_id`),
    KEY se_category (`se_category`),
    KEY city_id (`city_id`),
    KEY start_time (`start_time`),
    KEY end_time (`end_time`),
    KEY coupons_begin_time (`coupons_begin_time`),
    KEY coupons_end_time (`coupons_end_time`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  DEFAULT CHARSET = utf8;

# 会员表
CREATE TABLE `o2o_user`
(
    `id`              INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
    `username`        VARCHAR(20)      NOT NULL DEFAULT '',
    `password`        CHAR(32)         NOT NULL DEFAULT '',
    `code`            VARCHAR(10)      NOT NULL DEFAULT '',
    `last_login_ip`   VARCHAR(20)      NOT NULL DEFAULT '',
    `last_login_time` INT(11) UNSIGNED NOT NULL DEFAULT 0,
    `email`           VARCHAR(30)      NOT NULL DEFAULT '',
    `mobile`          VARCHAR(20)      NOT NULL DEFAULT '',
    `list_order`      INT(8) UNSIGNED  NOT NULL DEFAULT 0,
    `status`          TINYINT(1)       NOT NULL DEFAULT 0,
    `create_time`     INT(11) UNSIGNED NOT NULL DEFAULT 0,
    `update_time`     INT(11) UNSIGNED NOT NULL DEFAULT 0,
    PRIMARY KEY id (`id`),
    UNIQUE KEY username (`username`),
    UNIQUE KEY email (`email`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  DEFAULT CHARSET = utf8;

# 推荐位表
CREATE TABLE `o2o_featured`
(
    `id`          INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
    `type`        TINYINT(1)       NOT NULL DEFAULT 0,
    `title`       VARCHAR(30)      NOT NULL DEFAULT '',
    `image`       VARCHAR(255)     NOT NULL DEFAULT '',
    `url`         VARCHAR(255)     NOT NULL DEFAULT '',
    `description` VARCHAR(255)     NOT NULL DEFAULT '',
    `list_order`  INT(8) UNSIGNED  NOT NULL DEFAULT 0,
    `status`      TINYINT(1)       NOT NULL DEFAULT 0,
    `create_time` INT(11) UNSIGNED NOT NULL DEFAULT 0,
    `update_time` INT(11) UNSIGNED NOT NULL DEFAULT 0,
    PRIMARY KEY id (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  DEFAULT CHARSET = utf8;