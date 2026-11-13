CREATE DATABASE IF NOT EXISTS barcelona_rp CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE barcelona_rp;

CREATE TABLE IF NOT EXISTS players (
  user_id VARCHAR(32) PRIMARY KEY,
  guild_id VARCHAR(32) NOT NULL,
  nombre VARCHAR(80) NOT NULL,
  apellido VARCHAR(80) NOT NULL,
  fecha_nacimiento DATE NOT NULL,
  nacionalidad VARCHAR(80) NOT NULL DEFAULT 'Española',
  dinero BIGINT NOT NULL DEFAULT 500,
  banco BIGINT NOT NULL DEFAULT 0,
  trabajo VARCHAR(80) NOT NULL DEFAULT 'Desempleado',
  licencia_conducir TINYINT(1) NOT NULL DEFAULT 0,
  licencia_armas TINYINT(1) NOT NULL DEFAULT 0,
  nivel INT NOT NULL DEFAULT 1,
  experiencia INT NOT NULL DEFAULT 0,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS inventory (
  id INT AUTO_INCREMENT PRIMARY KEY,
  user_id VARCHAR(32) NOT NULL,
  item_key VARCHAR(64) NOT NULL,
  item_name VARCHAR(120) NOT NULL,
  quantity INT NOT NULL DEFAULT 1,
  UNIQUE KEY unique_user_item (user_id, item_key),
  CONSTRAINT fk_inventory_player FOREIGN KEY (user_id) REFERENCES players(user_id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS fines (
  id INT AUTO_INCREMENT PRIMARY KEY,
  guild_id VARCHAR(32) NOT NULL,
  user_id VARCHAR(32) NOT NULL,
  officer_id VARCHAR(32) NOT NULL,
  amount INT NOT NULL,
  reason VARCHAR(255) NOT NULL,
  paid TINYINT(1) NOT NULL DEFAULT 0,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS arrests (
  id INT AUTO_INCREMENT PRIMARY KEY,
  guild_id VARCHAR(32) NOT NULL,
  user_id VARCHAR(32) NOT NULL,
  officer_id VARCHAR(32) NOT NULL,
  reason VARCHAR(255) NOT NULL,
  minutes INT NOT NULL,
  released_at DATETIME NULL,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS cooldowns (
  user_id VARCHAR(32) NOT NULL,
  action_key VARCHAR(64) NOT NULL,
  available_at DATETIME NOT NULL,
  PRIMARY KEY (user_id, action_key)
);

CREATE TABLE IF NOT EXISTS server_config (
  guild_id VARCHAR(32) PRIMARY KEY,
  unverified_role_id VARCHAR(32) NULL,
  citizen_role_id VARCHAR(32) NULL,
  police_role_id VARCHAR(32) NULL,
  admin_role_id VARCHAR(32) NULL,
  logs_channel_id VARCHAR(32) NULL,
  ticket_category_id VARCHAR(32) NULL,
  ticket_transcripts_channel_id VARCHAR(32) NULL
);
