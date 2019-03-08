/*
ZONE Plugin for AfterShot Pro
Copyright 2014 Barna Keresztes

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing,
software distributed under the License is distributed on an "AS IS"
BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express
or implied. See the License for the specific language governing
permissions and limitations under the License.
*/

#include "ZoneFilter.h"
#include "PluginPipeSettings.h"
#include "PluginTile.h"
#include "PluginImage.h"
#include "PluginImageSettings.h"
#include "PluginOptionList.h"

#include "ZonePlugin.h"

#include <QDebug>
#include <iostream>

using namespace std;

//	Check if the plugin needs to run
bool ZoneFilter::needsToRunLayer(const PluginImageSettings &options, const PluginPipeSettings &settings, PluginOptionList &layerOptions) const
{
	Q_UNUSED( options );
	Q_UNUSED( settings );
	
	bool okay;
        bool val = layerOptions.getBool(ID_ENABLED, m_groupId, okay);
	return val;
}

QTransform ZoneFilter::transform(const PluginImageSettings &options, const PluginPipeSettings &settings) const
{
	Q_UNUSED( options );
	Q_UNUSED( settings );
	
	return QTransform();	//	We don't warp the image so return an identity transform.
}

QSize ZoneFilter::size(const PluginImageSettings &options, const PluginPipeSettings &settings, const QSize &startSize) const
{
	Q_UNUSED( options );
	Q_UNUSED( settings );
	
	return startSize;	//	We don't change the size of the image.
}

QList<PluginDependency*> ZoneFilter::prerequisites(const PluginImageSettings &options, const PluginPipeSettings &settings, PluginTile &tile) const
{
	Q_UNUSED( options );
	Q_UNUSED( settings );
	Q_UNUSED( tile );
	
	return QList<PluginDependency*>();	//	Empty list - we don't depend on any other tiles.
}

//	******************************************************************************
//	The processing function
//	Basically very similar to the B5 version, the processing loop can almost be used directly.
//	******************************************************************************
void ZoneFilter::runLayer(const PluginImageSettings &options, const PluginPipeSettings &settings, PluginTile &tile, PluginOptionList &layerOptions, int layerPos) const
{
	Q_UNUSED( options );
	Q_UNUSED( settings );
	Q_UNUSED( layerOptions );
	
	PluginImage *	pSrcImg = tile.image();
	PluginImage *	pDstImg;
	
	//	Layer 0 output should always go into tile.image(), otherwise output should go into tile.tmpImage()
	if ( layerPos == 0 )
		pDstImg = tile.image();
	else
		pDstImg = tile.tmpImage();
	
	//	Tile parameters
	int rw = pSrcImg->rowWords();	//	number of unsigned shorts in a row 
	int pw = pSrcImg->planeWords();	//	increment to get to the next color component in the plane
    int np = pSrcImg->nextPixel();	//	increment for the next pixel within the same color plane

	int tileWidth = settings.paddedWidth();        //Tile Dimensions
	int tileHeight = settings.paddedHeight();

	//	Reading the options
    int hl;
    bool bOk;
    hl=layerOptions.getInt( ID_HIGHLIGHT, m_groupId, bOk );

    uint16 *pSrc = NULL;
    uint16 *pOut = NULL;

	uint16 R,G,B;
	int zone;
	
	//	Processing loop
    for ( int y = 0; y < tileHeight; y++ )
	{
		pSrc = pSrcImg->data16() + rw * y;
		pOut = pDstImg->data16() + rw * y;
		for ( int x = 0; x < tileWidth; x++ )
		{
			zone=getZone(pSrc,pw);
			if(zone!=hl){R=G=B=zone*6500;}
			else{R=G=65000;B=32000;}
			setPixel(R,G,B,pOut,pw);
			pSrc+=np;pOut+=np;
		}
	}
}

//	Misc. functions, these aren't needed in your plugin
//	Replace them with your own functions
int ZoneFilter::getZone(uint16 *pIn,int pw) const
{
	double zone;
	zone=*(pIn)*0.000045777+*(pIn+pw)*0.000076295+*(pIn+pw+pw)*0.000030518+0.5;
	return (int)zone;
}
void ZoneFilter::setPixel(uint16 R, uint16 G, uint16 B, uint16 *pOut,int pw) const
{
	*pOut=R;*(pOut+pw)=G;*(pOut+pw+pw)=B;
}
