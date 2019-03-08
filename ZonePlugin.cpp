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

#include "ZonePlugin.h"
#include "ZoneFilter.h"
#include "PluginHub.h"
#include "PluginDependency.h"

#include <QDebug>
#include <QMessageBox>
#include <QAbstractButton>

extern "C" BIBBLE_API BaseB5Plugin *b5plugin() { return new ZonePlugin; }

bool ZonePlugin::init(PluginHub *hub, int id, int groupId, const QString &)
{
	m_hub = hub;
	m_id = id;
	m_groupId = groupId;
	return true;
}

// Registering the filters
bool ZonePlugin::registerFilters()
{
        //ZoneFilter is added after Negative Vignette in the processing pipe
        ZoneFilter *Zone = new ZoneFilter(m_hub, m_groupId);
        if (m_hub->addFilter(Zone, PluginHub::After, QString("Negative Vignette"))) {
		return true;
	}
        qDebug() << "Failed to load the Zone filter";
	return false;
}

//	Registering the options. It does the same thing as the B5 version, only the functions have different syntax
//	If you want translateable strings, add the tr(...) around it.
bool ZonePlugin::registerOptions()
{
        bool b = true;
		b &= m_hub->addBoolOption(ID_ENABLED, BB_ENABLED, tr("Enable"), tr("Enable Zone plugin"), FILTERNAME, false, false, PluginHub::POPTION_DOESNOTPERSIST);
        b &= m_hub->addIntOption(ID_HIGHLIGHT, BB_HIGHLIGHT, "OFF", tr("Select a zone to highlight"), FILTERNAME, -1, -1, PluginHub::POPTION_DOESNOTPERSIST);

        if ( b == false ) qDebug() << "ZonePlugin: Unable to register options.";

        return b;
}

//-----------------------------------------------------------------------------
//	Handle control change: if a control depends on an other (e.g. changing something enables the plugin)
void ZonePlugin::handleControlChange( const QString &optionName, int groupId, int layer, const PluginImageSettings &options, const PluginOptionList &current, PluginOptionList &changes )
{
        //	some changes do not have options - check for NULL
        if ( options.options( layer ) == NULL )return;
        //	ignore changes that aren't for us
        if ( groupId != m_groupId ) return;
        bool bOk;
		// if the plugin isn't enabled and the highlight slider is changed, enable the plugin
        if(!current.getBool(ID_ENABLED,m_groupId,bOk)){
            if (optionName==BB_HIGHLIGHT)changes.setBool(ID_ENABLED,m_groupId,true);
        }
}

//	About button
void ZonePlugin::showAbout() const
{
    QMessageBox::about( m_pWindow, tr( "Zone" ), tr( "Zone system preview in AfterShotPro\n (original idea by Ansel Adams)\nby Barna Keresztes\nLicensed under Apache License\n\n Use this plugin to preview the different zones of a photo\n based on the zone system developed by Ansel Adams.\nThis plugin won't modify your photo, it helps you to set the \n luminosity of the image\n Don't forget to turn it off before exporting the photo! \n\n For updates and more information visit my\n plugin page: http://www.kbarni.net" ) );
}

bool ZonePlugin::finish()
{
        // Connect to controlChanged so we can do some settings dependency logic
        connect( m_hub,
                     SIGNAL( controlChanged( const QString &, int, int , const PluginImageSettings &, const PluginOptionList &, PluginOptionList &) ),
                     SLOT( handleControlChange( const QString &, int, int , const PluginImageSettings &, const PluginOptionList &, PluginOptionList & ) ) );

	return true;
}

PluginDependency *ZonePlugin::createDependency(const QString &name)
{
	Q_UNUSED(name);
	return NULL;
}

QList<QString> ZonePlugin::toolFiles()
{
	return QList<QString>();
}

QList<QWidget*> ZonePlugin::toolWidgets()
{
	return QList<QWidget*>();
}

//	Connect the About button to the showAbout() function
void ZonePlugin::toolWidgetCreated(QWidget *uiWidget)
{
        if ( QAbstractButton * pAbout = uiWidget->findChild< QAbstractButton * >( BB_ABOUT ) )
                connect( pAbout, SIGNAL( clicked() ), SLOT( showAbout() ) );
        else qDebug() << "Zone: About button problem.";
        m_pWindow = uiWidget->window();
}
