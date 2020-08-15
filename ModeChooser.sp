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
	version = "1.0",
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
		PrintToChat( client, "Freak Fortress is currently active. Switch to a non-arena map to resume normal gameplay." );
}

static bool ValidFreakMap()
{
	char buffer[64]; // I'm starting to not like this langauge
	GetCurrentMap( buffer, sizeof( buffer ) ); // You know, Lua would have been a great scripting language for SourceMod
	
	bool freakmap = StrContains( buffer, "arena", false ) == 0 || StrContains( buffer, "vsh", false ) == 0;
	return freakmap;
}

static void SetFreakMap()
{
	char MapList[][] = {
		"arena_badlands",
		"arena_byre",
		"arena_granary",
		"arena_lumberyard",
		"arena_nucleus",
		"arena_offblast_final",
		"arena_ravine",
		"arena_sawmill",
		"arena_watchtower",
		"arena_well",
		"vsh_shipment_v1a",
		"vsh_scp_3008_final3",
		"koth_badlands",
		"koth_bagel_event",
		"koth_brazil",
		"koth_harvest_event",
		"koth_harvest_final",
		"koth_highpass",
		"koth_king",
		"koth_lakeside_event",
		"koth_lakeside_final",
		"koth_lazarus",
		"koth_maple_ridge_event",
		"koth_moonshine_event",
		"koth_nucleus",
		"koth_probed",
		"koth_sawmill",
		"koth_slasher",
		"koth_slaughter_event",
		"koth_suijin",
		"koth_viaduct",
		"koth_viaduct_event"
	};
	
	int rand = GetRandomInt( 0, sizeof( MapList ) - 1 );
	SetNextMap( MapList[rand] );
}

static void SetRandomMap()
{
	char MapList[][] = {
		"cp_5gorge",
		"cp_badlands",
		"cp_coldfront",
		"cp_dustbowl",
		"cp_fastlane",
		"cp_foundry",
		"cp_gravelpit",
		"cp_granary",
		"cp_powerhouse",
		"cp_process_final",
		"cp_snakewater_final1",
		"cp_standin_final",
		"cp_yukon_final",
		"cp_well",
		"ctf_2fort",
		"ctf_2fort_invasion",
		"ctf_foundry",
		"ctf_gorge",
		"ctf_sawmill",
		"ctf_thundermountain",
		"ctf_turbine",
		"ctf_well"
	};
	
	int rand = GetRandomInt( 0, sizeof( MapList ) - 1 );
	SetNextMap( MapList[rand] );
}
