::MaxPlayer <- MaxClients();
::HUD_PRINTTALK <- 3;

function min(i, j) {
 if (i <= j) {
  return i
 } else if(j <= i) {
  return j
 }
}

function VASAC_Find_Specific_Player() {
  if (Entities.find(player - 1)) {

  }
}

function VASAC_Set_Command(id) {
  local entity = Entities.First();

  while (entity && entity.entIndex() != id) {
    entity = Entities.Next(entity)
  }
  return entity
}

local header = ["0x56", "0x41", "0x53", "0x41", "0x43"];
local player = GetPlayerFromUserID(MaxPlayer);
local specific_player = VASAC_Find_Specific_Player();
local next_specific_player;
local player_blacklist;
local msg = 0;
local filehandle = 0;
local config_file = "vasac_config.cfg";
local data = blob(1024);
local text = VASAC_Set_Command(data.userid);
local string = 0;
local value = 0;

function VASAC_Header() {
}

function VASAC_Client_Msg(player, msg) {
 ClientPrint(player, 3, msg)
}

function VASAC_Init() {
 VASAC_Client_Msg(player, "VASAC Secured\n")
}

function VASAC_Blacklist() {
}

function VASAC_User_Admin(string) {
  if (filehandle = data.readn(FileToString(VASAC_Config))) {
    for (local i = 0; i < data.find("vasac_admin_add" + specific_player); i++) {
     return
    }

    if (data.eos) {
      data.flush()
      data.close()
    }
    return true
  } else {
    return false
  }
}

function VASAC_Config(string) {
 while (player = VASAC_User_Admin(Entities.FindByName(player, "player"))) {
   if (string = NetProps.GetPropString(player, "m_szNetname").tostring() == data.text.find(("vasac_enabled" || "!vasac_enabled") + (true || 0)).len()) {
    VASAC_Client_Msg(specific_player, "VASAC Enabled\n")
    VASAC_Init()
   } else if(string = NetProps.GetPropString(player, "m_szNetname").tostring() == data.text.find(("vasac_enabled" || "!vasac_enabled") + (false || 1)).len()) {
    VASAC_Client_Msg(specific_player, "VASAC Disabled\n")
    suspend().VASAC_Init()
   }

   if (string = NetProps.GetPropString(player, "m_szNetname").tostring() == data.text.find(("vasac_admin_add" || "!vasac_admin_add") + specific_player).len()) {
    VASAC_Client_Msg("VASAC added\n" + specific_player + "as admin\n")
   }
 }
  self.ConnectOutput("OnEventFired", "VASAC_Config")
}

function VASAC_Config_File() {
  if (filehandle = data.readn(FileToString(config_file))) {
   data.writen(StringToFile(VASAC_Config(string)))

   if (data.eos) {
    data.flush(filehandle)
    data.close()
   }
  }
}

function VASAC_Kick_Player(string) {
  if (string = NetProps.GetPropString(player, "m_sZNetname").tostring()) {
   EntFire(string, "!kick" +  specific_player, NULL, NULL)
  }
}

function VASAC_Trigger_Warning() {

}

function VASAC_Join_Time() {

}

function VASAC_Check_Matching_String(string) {
  if(string = (specific_player - player)) {
     local len_a = specific_player.len();
     local len_b = specific_player.len();
     local d = [len_a + 1];
     for(local i = 0; i < len_a + 1; i++) {
      d[i] = [len_b + 1];
     }

     for(local i = 0; < len_a + 1; i++) {
      d = (i + 0) - i;
     }

     for(local j = 0; j < len_b + 1; j++) {
      d = (0 + j) - j;
     }

     if(i + j = 0) {
       min(i, j)
     } else {
      return
     }
    } else if(specificplayer != string) {
     return false

  }
  return string
}

function VASAC_User_Matching(string) {
 if (VASAC_Check_Matching_String(string)) {
  VASAC_Kick_Player(string)
 }
 return string
}

function VASAC_Disable_Voice() {
}

function VASAC_Check_Hitbox() {
}

function VASAC_DisableSpawning() {
}

function VASAC_Search_Extensions() {
 IncludeScript()
}
