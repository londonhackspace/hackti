<?php
/*
 +-------------------------------------------------------------------------+
 | Copyright (C) 2004-2010 The Cacti Group                                 |
 |                                                                         |
 | This program is free software; you can redistribute it and/or           |
 | modify it under the terms of the GNU General Public License             |
 | as published by the Free Software Foundation; either version 2          |
 | of the License, or (at your option) any later version.                  |
 |                                                                         |
 | This program is distributed in the hope that it will be useful,         |
 | but WITHOUT ANY WARRANTY; without even the implied warranty of          |
 | MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the           |
 | GNU General Public License for more details.                            |
 +-------------------------------------------------------------------------+
 | Cacti: The Complete RRDTool-based Graphing Solution                     |
 +-------------------------------------------------------------------------+
 | This code is designed, written, and maintained by the Cacti Group. See  |
 | about.php and/or the AUTHORS file for specific developer information.   |
 +-------------------------------------------------------------------------+
 | http://www.cacti.net/                                                   |
 +-------------------------------------------------------------------------+
*/

$guest_account = true;
include("./include/auth.php");

if (db_fetch_cell("select id from user_auth where username='" . read_config_option("guest_user") . "'") == $_SESSION["sess_user_id"]) {
  header('Location: graph_view.php');
  exit;
}

include("./include/top_header.php");

?>
<table width="100%" align="center">
	<tr>
		<td class="textArea">
			<strong>You are now logged into <a href="about.php">Cacti</a>. You can follow these basic steps to get
			started.</strong>

			<ul>
				<li><a href="host.php">Create devices</a> for network</li>
				<li><a href="graphs_new.php">Create graphs</a> for your new devices</li>
				<li><a href="graph_view.php">View</a> your new graphs</li>
			</ul>
		</td>
		<td class="textArea" align="right" valign="top">
			<strong>Version <?php print $config["cacti_version"];?></strong>
		</td>
	</tr>
</table>

<?php

include("./include/bottom_footer.php");

?>
