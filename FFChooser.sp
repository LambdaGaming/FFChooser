#pragma semicolon 1
#include <sourcemod>
#include <sdktools>
#include <tf2>
#include <tf2_stocks>

public Plugin myinfo = 
{
	name = "ModeChooser",
	author = "LambdaGaming",
	description = "10% chance of Freak Fortress activating during normal map rotation.",
	version = "1.3",
	url = ""
};

public void OnPluginStart()
{
	PrintToServer( "[ModeChooser] Successfully loaded." );
}

public void OnMapEnd()
{
	if ( ValidFreakMap() )
	{
		SetFreakMap();
	}
	else
	{
		int rand = GetRandomInt( 1, 10 );
		if ( rand <= 10 )
		{
			SetFreakMap();
		}
		else
		{
			SetRandomMap();
		}
	}
}

public void OnClientPutInServer( int client )
{
	if ( ValidFreakMap() )
	{
		PrintToChat( client, "Freak Fortress is currently active. Switch to a non-arena map to resume normal gameplay." );
		PrintToChat( client, "If you need the Freak Fortress content, see the #useful-links channel on our discord server: https://discord.gg/9RGdUS2" );
	}
}

static bool ValidFreakMap()
{
	char buffer[64];
	GetCurrentMap( buffer, sizeof( buffer ) );
	
	bool freakmap = StrContains( buffer, "arena", false ) == 0 || StrContains( buffer, "vsh", false ) == 0;
	return freakmap;
}

static void SetFreakMap()
{
	char MapList[][] = {
		"arena_badlands", "arena_byre", "arena_granary",
		"arena_lumberyard", "arena_lumberyard_event", "arena_nucleus",
		"arena_offblast_final", "arena_ravine", "arena_sawmill",
		"arena_watchtower", "arena_well", "vsh_shipment_v1a",
		"vsh_scp_3008_final3", "vsh_distillery", "vsh_nucleus",
		"vsh_skirmish", "vsh_tinyrock", "arena_perks", "vsh_maul",
		"vsh_outburst"
	};
	
	int rand = GetRandomInt( 0, sizeof( MapList ) - 1 );
	SetNextMap( MapList[rand] );
}

static void SetRandomMap()
{
	char MapList[][] = {
		"cp_5gorge", "cp_badlands", "cp_coldfront", "cp_dustbowl",
		"cp_fastlane", "cp_foundry", "cp_gravelpit", "cp_granary",
		"cp_powerhouse", "cp_process_final", "cp_snakewater_final1",
		"cp_standin_final", "cp_yukon_final", "cp_well", "ctf_2fort",
		"ctf_2fort_invasion", "ctf_foundry", "ctf_gorge", "ctf_sawmill",
		"ctf_thundermountain", "ctf_turbine", "ctf_well"
	};
	
	int rand = GetRandomInt( 0, sizeof( MapList ) - 1 );
	SetNextMap( MapList[rand] );
}
