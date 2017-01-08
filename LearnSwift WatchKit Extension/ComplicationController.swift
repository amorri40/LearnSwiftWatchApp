//
//  ComplicationController.swift
//  LearnSwift WatchKit Extension
//
//  Created by Alasdair Morrison on 07/01/2017.
//  Copyright © 2017 Alasdair Morrison. All rights reserved.
//

import ClockKit


class ComplicationController: NSObject, CLKComplicationDataSource {
    
    // MARK: - Timeline Configuration
    
    func getSupportedTimeTravelDirections(for complication: CLKComplication, withHandler handler: @escaping (CLKComplicationTimeTravelDirections) -> Void) {
        handler([.forward, .backward])
    }
    
    func getTimelineStartDate(for complication: CLKComplication, withHandler handler: @escaping (Date?) -> Void) {
        handler(nil)
    }
    
    func getTimelineEndDate(for complication: CLKComplication, withHandler handler: @escaping (Date?) -> Void) {
        handler(nil)
    }
    
    func getPrivacyBehavior(for complication: CLKComplication, withHandler handler: @escaping (CLKComplicationPrivacyBehavior) -> Void) {
        handler(.showOnLockScreen)
    }
    
    func createComplicationTemplate() -> CLKComplicationTemplate {
        let template = CLKComplicationTemplateModularLargeTable()
        
        template.headerTextProvider = CLKSimpleTextProvider(text: "Help me over coffee")
        template.row1Column2TextProvider = CLKSimpleTextProvider(text: "NEW")
        template.row1Column1TextProvider = CLKSimpleTextProvider(text: "Lucy (Java)")
        template.row2Column2TextProvider = CLKTimeTextProvider(date: Date())
        template.row2Column1TextProvider = CLKSimpleTextProvider(text: "Peter (JS)")
        template.column2Alignment = CLKComplicationColumnAlignment.leading
        return template;
    }
    
    // MARK: - Timeline Population
    
    func getCurrentTimelineEntry(for complication: CLKComplication, withHandler handler: @escaping (CLKComplicationTimelineEntry?) -> Void) {
        // Call the handler with the current timeline entry
        //handler(nil)
        
        let timelineentry = CLKComplicationTimelineEntry()
        timelineentry.complicationTemplate = createComplicationTemplate()
        timelineentry.date = Date()
        handler(timelineentry)
    }
    
    // MARK: - Placeholder Templates
    
    func getLocalizableSampleTemplate(for complication: CLKComplication, withHandler handler: @escaping (CLKComplicationTemplate?) -> Void) {
        // This method will be called once per supported complication, and the results will be cached
        let complication_family = complication.family
//        if complication_family != CLKComplicationFamily.modularLarge {
//            handler(nil);
//            return;
//        }
        
        let template = CLKComplicationTemplateModularLargeTallBody()
        template.headerTextProvider = CLKSimpleTextProvider(text: "Ali2")
        template.bodyTextProvider = CLKSimpleTextProvider(text: "hello2")
        print(complication_family.rawValue, template.description)
        handler(createComplicationTemplate())
    }
    
//    func getPlaceholderTemplate(for complication: CLKComplication, withHandler handler: @escaping (CLKComplicationTemplate?) -> Void) {
//        // This method will be called once per supported complication, and the results will be cached
//        let template = CLKComplicationTemplateModularLargeTallBody()
//        template.headerTextProvider = CLKSimpleTextProvider(text: "Ali")
//        template.bodyTextProvider = CLKSimpleTextProvider(text: "Hello world")
//        handler(template)
//    }
    
}
