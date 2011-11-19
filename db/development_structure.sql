CREATE TABLE `mailboxes` (
  `id` int(11) NOT NULL,
  `gid` int(11) NOT NULL,
  `login` varchar(255) collate latin1_general_ci NOT NULL,
  `password` varchar(255) collate latin1_general_ci NOT NULL,
  `alias` varchar(255) collate latin1_general_ci NOT NULL,
  `maildir` varchar(255) collate latin1_general_ci NOT NULL,
  `quota` int(11) NOT NULL default '0',
  `info` varchar(255) collate latin1_general_ci default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `alias` (`alias`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

CREATE TABLE `rcpt_accesses` (
  `alias` varchar(255) collate latin1_general_ci NOT NULL,
  `action` varchar(255) collate latin1_general_ci NOT NULL,
  UNIQUE KEY `alias` (`alias`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

CREATE TABLE `remote_aliases` (
  `alias` varchar(255) collate latin1_general_ci NOT NULL,
  `rcpt` varchar(255) collate latin1_general_ci NOT NULL,
  UNIQUE KEY `alias` (`alias`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

CREATE TABLE `transports` (
  `domain` varchar(255) collate latin1_general_ci NOT NULL,
  `transport` varchar(255) collate latin1_general_ci NOT NULL,
  UNIQUE KEY `domain` (`domain`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

