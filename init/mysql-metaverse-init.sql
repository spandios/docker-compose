SET FOREIGN_KEY_CHECKS = 0;

CREATE SCHEMA `metaverse` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

USE metaverse;

DROP TABLE IF EXISTS `member` cascade ;
CREATE TABLE `member` (
  `id` binary(16) NOT NULL,
  `created_at` datetime(6) DEFAULT NULL COMMENT '생성일',
  `authority` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `world`;
CREATE TABLE `world` (
  `id` binary(16) NOT NULL,
  `created_at` datetime(6) DEFAULT NULL COMMENT '생성일',
  `object_id` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '사물 고유 아이디(mgId)',
  `seed` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '시드',
  `world_module_id1` int NOT NULL,
  `world_module_id10` int NOT NULL,
  `world_module_id11` int NOT NULL,
  `world_module_id12` int NOT NULL,
  `world_module_id13` int NOT NULL,
  `world_module_id14` int NOT NULL,
  `world_module_id15` int NOT NULL,
  `world_module_id16` int NOT NULL,
  `world_module_id17` int NOT NULL,
  `world_module_id18` int NOT NULL,
  `world_module_id19` int NOT NULL,
  `world_module_id2` int NOT NULL,
  `world_module_id20` int NOT NULL,
  `world_module_id21` int NOT NULL,
  `world_module_id3` int NOT NULL,
  `world_module_id4` int NOT NULL,
  `world_module_id5` int NOT NULL,
  `world_module_id6` int NOT NULL,
  `world_module_id7` int NOT NULL,
  `world_module_id8` int NOT NULL,
  `world_module_id9` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `world_module`;
CREATE TABLE `world_module` (
  `id` int NOT NULL,
  `created_at` datetime(6) DEFAULT NULL COMMENT '생성일',
  `model_angle` smallint NOT NULL DEFAULT '0' COMMENT '모델 회전 각도 : 0, 90, 180, 270',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `asset`;
CREATE TABLE `asset` (
  `id` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime(6) DEFAULT NULL COMMENT '생성일',
  `description` varchar(512) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '설명',
  `name` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '이름',
  `price` int unsigned NOT NULL COMMENT '판매가격',
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '타입(사물, 건물, 바닥타일)',
  `uri` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'asset 주소(빈텍스트인 경우 asset bundle에 포함되어있음)',
  `creator_id` binary(16) NOT NULL COMMENT '제작자(default:company,  else: nft)',
  PRIMARY KEY (`id`),
  KEY `FK4bmi5hcv99j7ghet3enm47nef` (`creator_id`),
  CONSTRAINT `FK4bmi5hcv99j7ghet3enm47nef` FOREIGN KEY (`creator_id`) REFERENCES `member` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `avatar`;
CREATE TABLE `avatar` (
  `id` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime(6) DEFAULT NULL COMMENT '생성일',
  `price` int NOT NULL COMMENT '판매가격',
  `member_id` binary(16) NOT NULL COMMENT '제작자(default:company,  else: nft)',
  PRIMARY KEY (`id`),
  KEY `FK19gyayk5srtmmrwft2cu1rr0v` (`member_id`),
  CONSTRAINT `FK19gyayk5srtmmrwft2cu1rr0v` FOREIGN KEY (`member_id`) REFERENCES `member` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `land`;
CREATE TABLE `land` (
  `id` int NOT NULL COMMENT '랜드 고유 ID',
  `created_at` datetime(6) DEFAULT NULL COMMENT '생성일',
  `for_sale` tinyint(1) NOT NULL DEFAULT '1' COMMENT '판매여부 default = true',
  `land_angle` enum('0','90','180','270') COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '랜드 회전 값 : 0, 90, 180, 270',
  `land_design` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '랜드 위에 건물, 식생 등 꾸밈요소 꾸밈요소 초기값',
  `land_level` tinyint NOT NULL DEFAULT '1' COMMENT '랜드 레벨',
  `land_price` int NOT NULL COMMENT '랜드 가격 1당 1매쉬',
  `land_size` tinyint NOT NULL COMMENT '랜드 크기(단위 셀) 3, 4, 6, 8, 12, 16, 20, 24 ex) 3 => 3x3 ',
  `land_type` tinyint NOT NULL COMMENT '랜드 타입 0: 광장 1: 부스터/상, 2: 부스터/하, 3: 상가, 4: 공공, 5: 공공/제휴, 6: 녹지',
  `x` smallint NOT NULL COMMENT 'X 좌표',
  `z` smallint NOT NULL COMMENT 'Z 좌표',
  `world_module_id` int NOT NULL COMMENT '월드 모듈',
  PRIMARY KEY (`id`),
  KEY `FKqrks0kfsw8u7ju1j55mfskbly` (`world_module_id`),
  CONSTRAINT `FKqrks0kfsw8u7ju1j55mfskbly` FOREIGN KEY (`world_module_id`) REFERENCES `world_module` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



DROP TABLE IF EXISTS `member_asset`;
CREATE TABLE `member_asset` (
  `id` binary(16) NOT NULL,
  `created_at` datetime(6) DEFAULT NULL COMMENT '생성일',
  `degree` smallint unsigned NOT NULL COMMENT '회전 값',
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '상태(사용, 미사용)',
  `x` decimal(4,2) unsigned NOT NULL COMMENT '중심 x좌표',
  `y` decimal(4,2) unsigned NOT NULL COMMENT '중심 y좌표',
  `z` decimal(4,2) unsigned NOT NULL COMMENT '중심 z좌표',
  `asset_id` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `member_id` binary(16) NOT NULL,
  `world_id` binary(16) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK2uabcswpkydn6d3b4hjrrl5a5` (`asset_id`),
  KEY `FK9vhh5x20raudy0kic1cidi0vj` (`member_id`),
  KEY `FK4dnitdku4mw3rbyugg5v3tube` (`world_id`),
  CONSTRAINT `FK2uabcswpkydn6d3b4hjrrl5a5` FOREIGN KEY (`asset_id`) REFERENCES `asset` (`id`),
  CONSTRAINT `FK4dnitdku4mw3rbyugg5v3tube` FOREIGN KEY (`world_id`) REFERENCES `world` (`id`),
  CONSTRAINT `FK9vhh5x20raudy0kic1cidi0vj` FOREIGN KEY (`member_id`) REFERENCES `member` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `member_avatar`;
create table member_avatar
(
    id         varchar(16)  not null
        primary key,
    created_at datetime(6)  null comment '생성일',
    hair_color varchar(255) not null comment '헤어 컬러값',
    status     int          null comment '상태',
    avatar_id  varchar(32)  not null,
    bottom_id  varchar(16)  null,
    glasses_id varchar(16)  null,
    member_id  binary(16)   not null,
    shoes_id   varchar(16)  null,
    top_id     varchar(16)  null,
    constraint FK727b116l4brgpne9l1duaqnmk
        foreign key (glasses_id) references member_wearable (id),
    constraint FKjf46uec7a74yg01d2y0460fn
        foreign key (shoes_id) references member_wearable (id),
    constraint FKkii0qkfm4wyd9ku1i2tdd24g
        foreign key (top_id) references member_wearable (id),
    constraint FKokm6agi2d2341ioaplxqly989
        foreign key (bottom_id) references member_wearable (id),
    constraint FKr6q3ortcqcmaxtoh1sghgebwo
        foreign key (avatar_id) references avatar (id),
    constraint FKtdextwyhkcpiw7aimgaic8rf2
        foreign key (member_id) references member (id)
);

DROP TABLE IF EXISTS `member_land`;
CREATE TABLE `member_land` (
  `id` int NOT NULL,
  `created_at` datetime(6) DEFAULT NULL COMMENT '생성일',
  `tile_id` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `x` int unsigned NOT NULL COMMENT 'x좌표',
  `z` int unsigned NOT NULL COMMENT 'z좌표',
  `member_id` binary(16) NOT NULL,
  `world_id` binary(16) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKdo4ni9lmqayinfjjt0xaxhj5x` (`member_id`),
  KEY `FK5fdu0a3ypvspj1bft9s89fltj` (`world_id`),
  CONSTRAINT `FK5fdu0a3ypvspj1bft9s89fltj` FOREIGN KEY (`world_id`) REFERENCES `world` (`id`),
  CONSTRAINT `FKdo4ni9lmqayinfjjt0xaxhj5x` FOREIGN KEY (`member_id`) REFERENCES `member` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `wearable`;
CREATE TABLE `wearable` (
  `id` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime(6) DEFAULT NULL COMMENT '생성일',
  `description` varchar(512) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '설명',
  `name` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '이름',
  `price` int unsigned NOT NULL COMMENT '판매가격',
  `type` int NOT NULL COMMENT '타입(상의, 하의, 신발, 안경)',
  `uri` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'asset 주소(빈텍스트인 경우 asset bundle에 포함되어있음)',
  `creator_id` binary(16) NOT NULL COMMENT '제작자(default:company,  else: nft)',
  PRIMARY KEY (`id`),
  KEY `FKms600nhhphfcqtkyfm55pv13` (`creator_id`),
  CONSTRAINT `FKms600nhhphfcqtkyfm55pv13` FOREIGN KEY (`creator_id`) REFERENCES `member` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `member_wearable`;
CREATE TABLE `member_wearable` (
  `id` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL,
  `member_id` binary(16) NOT NULL COMMENT '유저 아이디',
  `wearable_id` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKf7ev43ihh7sbeppijq5p3ta47` (`member_id`),
  KEY `FK63j4uyp6pftm1sjaeli0r3pnu` (`wearable_id`),
  CONSTRAINT `FK63j4uyp6pftm1sjaeli0r3pnu` FOREIGN KEY (`wearable_id`) REFERENCES `wearable` (`id`),
  CONSTRAINT `FKf7ev43ihh7sbeppijq5p3ta47` FOREIGN KEY (`member_id`) REFERENCES `member` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


SET FOREIGN_KEY_CHECKS = 1;