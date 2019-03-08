#pragma once

#include "B5Plugin.h"
#include "PluginRevisions.h"

#include "PluginOptionList.h"
#include "PluginImageSettings.h"

#include <QString>
#include <QObject>

#define PLUGINNAME	"Zone"				// The  plugin group/owner name  for all of yout plug-in's settings keep it short but unique
#define PLUGINGROUP	"Zone_kb"

//	Define here the names and IDs of your controls. 
//	Note that the buttons don't need IDs
#define BB_ENABLED	"kbz_enabled"			// Boolean - is the plug-in enabled?
#define BB_HIGHLIGHT "kbz_highlight"		// Integer - Red gain

#define ID_ENABLED	20
#define ID_HIGHLIGHT 21

#define BB_ABOUT	"kbz_about_button"				// About button

//	The Plugin class
class ZonePlugin : public QObject, public B5Plugin
{
        Q_OBJECT

public:
	ZonePlugin() : m_hub( NULL ), m_id( -1 ), m_groupId( -1 ), m_pWindow( NULL ) { ; }
	virtual int priority() { return 100; }
	virtual QString name() { return QString(PLUGINNAME); }
	virtual QString group() { return QString(PLUGINGROUP); }
	virtual bool init(PluginHub *hub, int id, int groupId, const QString &bundlePath);
	virtual bool registerFilters();
	virtual bool registerOptions();
	virtual bool finish();
	virtual PluginDependency *createDependency(const QString &name);
	virtual QList<QString> toolFiles();
	virtual QList<QWidget*> toolWidgets();
	virtual void toolWidgetCreated(QWidget *uiWidget);

private slots:
	void showAbout() const;
	void handleControlChange(const QString &optionName, int groupId, int layer, const PluginImageSettings &options, const PluginOptionList &current, PluginOptionList &changes);

private:
	PluginHub *m_hub;
	int m_id;
	int m_groupId;
	QWidget *m_pWindow;
};
