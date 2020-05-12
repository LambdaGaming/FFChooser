#pragma semicolon 1
#include <sourcemod>
#include <sdktools>
#include <tf2>
#include <tf2_stocks>

public Plugin myinfo = 
{
	name = "WarioMap",
	author = "LambdaGaming",
	description = "Random chance to change to special round.",
	version = "1.0",
	url = ""
};

public void OnPluginStart()
{
	PrintToServer( "[WarioMap] Successfully loaded." );
}

public void OnMapEnd()
{
	DisableSpecialRounds();
	int rand = GetRandomInt( 1, 100 );
	if ( rand <= 10 )
	{
		RandomMode();
	}
}

static void RandomMode()
{
	
	int rand = GetRandomInt( 1, 2 );
	switch ( rand )
	{
		case 1:
		{
			ConVar wariotime = FindConVar( "ww_enable" );
			SetConVarInt( wariotime, 1 );
			ForceChangeLevel( "tf2ware2_a4", "WARIO TIME!" );
		}
		case 2:
		{
			ConVar hale = FindConVar( "ff2_enabled" );
			SetConVarInt( hale, 1 );
			ForceChangeLevel( "vsh_shipment_v1", "SAXTON HAAAAAAAAAAAAAAAAAAALE!" );
		}
	}
}

static void DisableSpecialRounds()
{
	ConVar wariotime = FindConVar( "ww_enable" );
	if ( wariotime != null )
		SetConVarInt( wariotime, 0 );
	ConVar hale = FindConVar( "ff2_enabled" );
	if ( hale != null )
		SetConVarInt( hale, 0 );
}
