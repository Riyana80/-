CREATE TABLE `cart` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED DEFAULT NULL,
  `product_id` int(11) UNSIGNED DEFAULT NULL,
  `kol` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `category` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `menu` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `news` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `order` (
  `id` int(11) UNSIGNED NOT NULL,
  `date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `user_id` int(11) UNSIGNED DEFAULT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `orderstatus_id` int(11) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `orderstatus` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `order_product` (
  `id` int(11) UNSIGNED NOT NULL,
  `product_id` int(11) UNSIGNED DEFAULT NULL,
  `order_id` int(11) UNSIGNED DEFAULT NULL,
  `kol` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `product` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `price` double NOT NULL,
  `category_id` int(11) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `rating` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lname` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `request` (
  `id` int(11) UNSIGNED NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci,
  `date` date DEFAULT NULL,
  `user_id` int(11) UNSIGNED DEFAULT NULL,
  `product_id` int(11) UNSIGNED DEFAULT NULL,
  `rating_id` int(11) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `slide` (
  `id` int(11) UNSIGNED NOT NULL,
  `product_id` int(11) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `user` (
  `id` int(11) UNSIGNED NOT NULL,
  `lastname` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `firstname` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fname` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `userstatus_id` int(11) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `userstatus` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index_foreignkey_cart_user` (`user_id`),
  ADD KEY `index_foreignkey_cart_product` (`product_id`);

ALTER TABLE `category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index_foreignkey_category_parent` (`parent_id`);

ALTER TABLE `menu`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `news`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index_foreignkey_order_user` (`user_id`),
  ADD KEY `index_foreignkey_order_orderstatus` (`orderstatus_id`);

ALTER TABLE `orderstatus`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `order_product`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UQ_72c780df41fbb5ef3e7e73a96d04067ddafefa10` (`order_id`,`product_id`),
  ADD KEY `index_foreignkey_order_product_product` (`product_id`),
  ADD KEY `index_foreignkey_order_product_order` (`order_id`);

ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index_foreignkey_product_category` (`category_id`);

ALTER TABLE `rating`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `request`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index_foreignkey_request_user` (`user_id`),
  ADD KEY `index_foreignkey_request_product` (`product_id`),
  ADD KEY `index_foreignkey_request_rating` (`rating_id`);

ALTER TABLE `slide`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `product_id` (`product_id`),
  ADD KEY `index_foreignkey_slide_product` (`product_id`);

ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index_foreignkey_user_userstatus` (`userstatus_id`);

ALTER TABLE `userstatus`
  ADD PRIMARY KEY (`id`);


ALTER TABLE `cart`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `category`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

ALTER TABLE `menu`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

ALTER TABLE `news`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

ALTER TABLE `order`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

ALTER TABLE `orderstatus`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

ALTER TABLE `order_product`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

ALTER TABLE `product`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

ALTER TABLE `rating`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

ALTER TABLE `request`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

ALTER TABLE `slide`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

ALTER TABLE `user`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

ALTER TABLE `userstatus`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;


ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE SET NULL ON UPDATE SET NULL;

ALTER TABLE `category`
  ADD CONSTRAINT `c_fk_category_parent_id` FOREIGN KEY (`parent_id`) REFERENCES `category` (`id`) ON DELETE SET NULL ON UPDATE SET NULL;

ALTER TABLE `order`
  ADD CONSTRAINT `c_fk_order_orderstatus_id` FOREIGN KEY (`orderstatus_id`) REFERENCES `orderstatus` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `c_fk_order_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE SET NULL;

ALTER TABLE `order_product`
  ADD CONSTRAINT `order_product_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `order_product_ibfk_2` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `product`
  ADD CONSTRAINT `c_fk_product_category_id` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE SET NULL ON UPDATE SET NULL;

ALTER TABLE `request`
  ADD CONSTRAINT `c_fk_request_product_id` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `c_fk_request_rating_id` FOREIGN KEY (`rating_id`) REFERENCES `rating` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `c_fk_request_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE SET NULL;

ALTER TABLE `slide`
  ADD CONSTRAINT `c_fk_slide_product_id` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE SET NULL ON UPDATE SET NULL;

ALTER TABLE `user`
  ADD CONSTRAINT `c_fk_user_userstatus_id` FOREIGN KEY (`userstatus_id`) REFERENCES `userstatus` (`id`) ON DELETE SET NULL ON UPDATE SET NULL;

COMMIT;