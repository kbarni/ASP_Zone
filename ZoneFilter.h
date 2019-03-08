#pragma once

#include "PluginLayerFilter.h"
#include "PluginHub.h"

#define FILTERNAME      "ZoneFilter"

typedef unsigned short uint16; 

// This is a filter class
// Probably you don't have to change much here...

class ZoneFilter : public PluginLayerFilter
{
public:
	ZoneFilter(PluginHub *hub, int groupId) : m_hub(hub), m_groupId(groupId) { ; }

	virtual QString name() const { return QString(FILTERNAME); }

	virtual bool needsToRunLayer(const PluginImageSettings &options, const PluginPipeSettings &settings, PluginOptionList &layerOptions) const;
	virtual void runLayer(const PluginImageSettings &options, const PluginPipeSettings &settings, PluginTile &tile, PluginOptionList &layerOptions, int layerPos) const;
	virtual bool needsOriginalImage() { return false; }

	virtual bool isSlow(const PluginImageSettings &, const PluginPipeSettings &) const { return false; }
	virtual bool isLargeRadius(const PluginImageSettings &, const PluginPipeSettings &) const { return false; }
	virtual bool isPixelSource(const PluginImageSettings &, const PluginPipeSettings &) const { return false; }
	virtual QTransform transform(const PluginImageSettings &options, const PluginPipeSettings &settings) const;
	virtual QSize size(const PluginImageSettings &options, const PluginPipeSettings &settings, const QSize &startSize) const;
	virtual QList<PluginDependency*> prerequisites(const PluginImageSettings &options, const PluginPipeSettings &settings, PluginTile &tile) const;

private:
	PluginHub *m_hub;
	int m_groupId;
	int getZone(uint16 *pIn,int pw) const;
	void setPixel(uint16 R, uint16 G, uint16 B, uint16 *pOut,int pw) const;
};
