// Copyright Epic Games, Inc. All Rights Reserved.

#include "PatchingDemoGameMode.h"
#include "PatchingDemoCharacter.h"
#include "UObject/ConstructorHelpers.h"

APatchingDemoGameMode::APatchingDemoGameMode()
{
	// set default pawn class to our Blueprinted character
	static ConstructorHelpers::FClassFinder<APawn> PlayerPawnBPClass(TEXT("/Game/ThirdPerson/Blueprints/BP_ThirdPersonCharacter"));
	if (PlayerPawnBPClass.Class != NULL)
	{
		DefaultPawnClass = PlayerPawnBPClass.Class;
	}
}
