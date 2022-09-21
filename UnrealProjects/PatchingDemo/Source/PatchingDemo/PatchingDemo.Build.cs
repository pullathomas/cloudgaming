// Copyright Epic Games, Inc. All Rights Reserved.

using UnrealBuildTool;

public class PatchingDemo : ModuleRules
{
	public PatchingDemo(ReadOnlyTargetRules Target) : base(Target)
	{
		PCHUsage = PCHUsageMode.UseExplicitOrSharedPCHs;

		PublicDependencyModuleNames.AddRange(new string[] { "Core", "CoreUObject", "Engine", "InputCore", "HeadMountedDisplay" });
		PrivateDependencyModuleNames.AddRange(
		  new string[]
		  {
			  "ChunkDownloader",
			  "HTTP"
		  });

    }
}
