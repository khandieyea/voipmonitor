CREATE TABLE `cdr` (
  `ID` int(32) unsigned NOT NULL auto_increment,
  `calldate` datetime NOT NULL,
  `duration` int(32) unsigned NOT NULL,
  `connect_duration` int(32) unsigned NOT NULL,
  `progress_time` int(32) unsigned NOT NULL,
  `first_rtp_time` int(32) unsigned NOT NULL,
  `caller` varchar(255) NOT NULL,
  `callername` varchar(255) NOT NULL,
  `called` varchar(255) NOT NULL,
  `sipcallerip` int(32) unsigned NOT NULL,
  `sipcalledip` int(32) unsigned NOT NULL,
  `fbasename` varchar(255) NOT NULL,
  `bye` tinyint(2) NOT NULL default 2,
  `sighup` tinyint(2) NOT NULL default 0,
  `a_index` tinyint(3) NOT NULL,
  `b_index` tinyint(3) NOT NULL,
  `a_payload` int(8) NOT NULL,
  `b_payload` int(8) NOT NULL,
  `a_saddr` int(32) unsigned NOT NULL,
  `b_saddr` int(32) unsigned NOT NULL,
  `a_received` int(32) unsigned NOT NULL,
  `b_received` int(32) unsigned NOT NULL,
  `a_lost` int(32) unsigned NOT NULL,
  `b_lost` int(32) unsigned NOT NULL,
  `a_ua` varchar(1024) NULL,
  `b_ua` varchar(1024) NULL,
  `a_avgjitter` float(32) NOT NULL,
  `b_avgjitter` float(32) NOT NULL,
  `a_maxjitter` float(32) NOT NULL,
  `b_maxjitter` float(32) NOT NULL,
  `a_sl1` int(32) unsigned NOT NULL,
  `a_sl2` int(32) unsigned NOT NULL,
  `a_sl3` int(32) unsigned NOT NULL,
  `a_sl4` int(32) unsigned NOT NULL,
  `a_sl5` int(32) unsigned NOT NULL,
  `a_sl6` int(32) unsigned NOT NULL,
  `a_sl7` int(32) unsigned NOT NULL,
  `a_sl8` int(32) unsigned NOT NULL,
  `a_sl9` int(32) unsigned NOT NULL,
  `a_sl10` int(32) unsigned NOT NULL,
  `a_d50` int(32) unsigned NOT NULL,
  `a_d70` int(32) unsigned NOT NULL,
  `a_d90` int(32) unsigned NOT NULL,
  `a_d120` int(32) unsigned NOT NULL,
  `a_d150` int(32) unsigned NOT NULL,
  `a_d200` int(32) unsigned NOT NULL,
  `a_d300` int(32) unsigned NOT NULL,
  `b_sl1` int(32) unsigned NOT NULL,
  `b_sl2` int(32) unsigned NOT NULL,
  `b_sl3` int(32) unsigned NOT NULL,
  `b_sl4` int(32) unsigned NOT NULL,
  `b_sl5` int(32) unsigned NOT NULL,
  `b_sl6` int(32) unsigned NOT NULL,
  `b_sl7` int(32) unsigned NOT NULL,
  `b_sl8` int(32) unsigned NOT NULL,
  `b_sl9` int(32) unsigned NOT NULL,
  `b_sl10` int(32) unsigned NOT NULL,
  `b_d50` int(32) unsigned NOT NULL,
  `b_d70` int(32) unsigned NOT NULL,
  `b_d90` int(32) unsigned NOT NULL,
  `b_d120` int(32) unsigned NOT NULL,
  `b_d150` int(32) unsigned NOT NULL,
  `b_d200` int(32) unsigned NOT NULL,
  `b_d300` int(32) unsigned NOT NULL,
  `a_mos_f1` float(8) unsigned NOT NULL,
  `a_mos_f2` float(8) unsigned NOT NULL,
  `a_mos_adapt` float(8) unsigned NOT NULL,
  `a_lossr_f1` float(8) unsigned NOT NULL,
  `a_lossr_f2` float(8) unsigned NOT NULL,
  `a_lossr_adapt` float(8) unsigned NOT NULL,
  `a_burstr_f1` float(8) unsigned NOT NULL,
  `a_burstr_f2` float(8) unsigned NOT NULL,
  `a_burstr_adapt` float(8) unsigned NOT NULL,
  `b_mos_f1` float(8) unsigned NOT NULL,
  `b_mos_f2` float(8) unsigned NOT NULL,
  `b_mos_adapt` float(8) unsigned NOT NULL,
  `b_lossr_f1` float(8) unsigned NOT NULL,
  `b_lossr_f2` float(8) unsigned NOT NULL,
  `b_lossr_adapt` float(8) unsigned NOT NULL,
  `b_burstr_f1` float(8) unsigned NOT NULL,
  `b_burstr_f2` float(8) unsigned NOT NULL,
  `b_burstr_adapt` float(8) unsigned NOT NULL,
  PRIMARY KEY  (`ID`),
  KEY `calldate` (`calldate`),
  KEY `duration` (`duration`),
  KEY `source` (`caller`),
  KEY `destination` (`called`),
  KEY `sipcallerip` (`sipcallerip`),
  KEY `sipcalledip` (`sipcalledip`),
  KEY `a_saddr` (`a_saddr`),
  KEY `b_saddr` (`b_saddr`),
  KEY `a_lost` (`a_lost`),
  KEY `b_lost` (`b_lost`),
  KEY `a_avgjitter` (`a_avgjitter`),
  KEY `b_avgjitter` (`b_avgjitter`),
  KEY `a_maxjitter` (`a_maxjitter`),
  KEY `b_maxjitter` (`b_maxjitter`),
  KEY `a_lossr_f1` (`a_lossr_f1`),
  KEY `a_lossr_f2` (`a_lossr_f2`),
  KEY `a_lossr_adapt` (`a_lossr_adapt`),
  KEY `a_burstr_f1` (`a_burstr_f1`),
  KEY `a_burstr_f2` (`a_burstr_f2`),
  KEY `a_burstr_adapt` (`a_burstr_adapt`),
  KEY `b_lossr_f1` (`b_lossr_f1`),
  KEY `b_lossr_f2` (`b_lossr_f2`),
  KEY `b_lossr_adapt` (`b_lossr_adapt`),
  KEY `b_burstr_f1` (`b_burstr_f1`),
  KEY `b_burstr_f2` (`b_burstr_f2`),
  KEY `b_burstr_adapt` (`b_burstr_adapt`)
) ENGINE=InnoDB;
