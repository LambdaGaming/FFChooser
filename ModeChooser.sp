#pragma semicolon 1
#include <sourcemod>
#include <sdktools>
#include <tf2>
#include <tf2_stocks>

public Plugin myinfo = 
{
	name = "ModeChooser",
	author = "LambdaGaming",
	description = "Random chance to change to special round.",
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
		SetRandomMap();
	}
	else
	{
		int rand = GetRandomInt( 1, 10 );
		if ( rand <= 10 )
		{
			SetFreakMap();
		}
	}
}

static bool ValidFreakMap()
{
	char buffer[64]; // I'm starting to not like this langauge
	GetCurrentMap( buffer, sizeof( buffer ) ); // You know, Lua would have been a great scripting language for SourceMod
	if ( StrContains( buffer, "arena", false ) == 0 || StrContains( buffer, "vsh", false ) == 0 )
		return true;
	return false;
}

static void SetFreakMap()
{
	char MapList[][] = {
		"arena_badlands",
		"arena_granary",
		"arena_sawmill",
		"arena_well",
		"vsh_shipment_v1"
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
