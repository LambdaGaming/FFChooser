#pragma semicolon 1
#include <sourcemod>
#include <sdktools>
#include <tf2>
#include <tf2_stocks>

public Plugin myinfo = 
{
	name = "WarioMap",
	author = "LambdaGaming",
	description = "Random chance to change to wario map.",
	version = "1.0",
	url = ""
};

public void OnPluginStart()
{
	PrintToServer( "[WarioMap] Successfully loaded." );
}

public void OnMapEnd()
{
	int rand = GetRandomInt( 1, 100 );
	if ( rand <= 10 )
	{
		ForceChangeLevel( "cp_5gorge", "WARIO TIME!" );
	}
}
