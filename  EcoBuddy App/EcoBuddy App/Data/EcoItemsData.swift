import Foundation

struct EcoItemsData {
    
    // MARK: - All Eco Items
    static let allItems: [EcoItem] = [
        EcoItem(
            name: "Plastic Bottle",
            icon: "waterbottle.fill",
            category: "Plastic",
            disposalType: .recyclable,
            environmentalImpact: "Plastic bottles take 450+ years to decompose. They break down into microplastics that pollute oceans and harm marine life.",
            decompositionTime: "450+ years",
            carbonFootprint: "High - 82.8g CO₂ per bottle",
            reuseIdeas: [
                ReuseIdea(title: "Plant Watering Can", description: "Poke holes in the cap to create a simple watering can for plants.", difficulty: .easy, icon: "drop.fill"),
                ReuseIdea(title: "Desk Organizer", description: "Cut the bottle and use it to store pens, pencils, and small items.", difficulty: .easy, icon: "pencil"),
                ReuseIdea(title: "Bird Feeder", description: "Cut openings and fill with seeds to create a hanging bird feeder.", difficulty: .medium, icon: "bird.fill")
            ],
            disposalInstructions: "Remove cap and rinse bottle. Crush to save space. Place in blue recycling bin.",
            recyclingTips: ["Remove all labels if possible", "Keep cap separate", "Don't crush if local facility prefers whole bottles"]
        ),
        
        EcoItem(
            name: "Paper",
            icon: "doc.fill",
            category: "Paper",
            disposalType: .recyclable,
            environmentalImpact: "Paper production requires trees and water. However, it's highly recyclable and biodegradable.",
            decompositionTime: "2-6 weeks",
            carbonFootprint: "Low - Biodegradable and recyclable",
            reuseIdeas: [
                ReuseIdea(title: "Scrap Paper", description: "Use the blank side for notes, drawings, or printing drafts.", difficulty: .easy, icon: "note.text"),
                ReuseIdea(title: "Paper Crafts", description: "Create origami, greeting cards, or art projects.", difficulty: .easy, icon: "star.fill"),
                ReuseIdea(title: "Compost Material", description: "Shred and add to compost as brown material.", difficulty: .medium, icon: "leaf")
            ],
            disposalInstructions: "Remove plastic windows or staples. Keep dry and clean. Place in blue recycling bin.",
            recyclingTips: ["No food-stained paper", "Shredded paper in paper bag", "Flatten cardboard boxes"]
        ),
        
        EcoItem(
            name: "Glass Jar",
            icon: "cylinder.fill",
            category: "Glass",
            disposalType: .recyclable,
            environmentalImpact: "Glass is 100% recyclable infinitely without quality loss. However, production is energy-intensive.",
            decompositionTime: "1 million years (but fully recyclable)",
            carbonFootprint: "Medium - High energy to produce, but infinitely recyclable",
            reuseIdeas: [
                ReuseIdea(title: "Food Storage", description: "Use for storing dry goods, leftovers, or meal prep.", difficulty: .easy, icon: "fork.knife"),
                ReuseIdea(title: "Candle Holder", description: "Clean and use as a decorative candle holder.", difficulty: .easy, icon: "flame.fill"),
                ReuseIdea(title: "Terrarium", description: "Create a mini garden ecosystem inside the jar.", difficulty: .advanced, icon: "leaf.circle.fill")
            ],
            disposalInstructions: "Rinse thoroughly. Remove lids (recycle separately). Place in glass recycling.",
            recyclingTips: ["Separate by color if required", "Remove metal lids", "No broken glass in regular recycling"]
        ),
        
        EcoItem(
            name: "Aluminum Can",
            icon: "cylinder.split.1x2.fill",
            category: "Metal",
            disposalType: .recyclable,
            environmentalImpact: "Recycling aluminum saves 95% of the energy needed to make new cans. Highly valuable recyclable.",
            decompositionTime: "200-500 years",
            carbonFootprint: "Medium - But recycling saves massive energy",
            reuseIdeas: [
                ReuseIdea(title: "Pen Holder", description: "Clean and decorate to hold pens and pencils.", difficulty: .easy, icon: "pencil.circle"),
                ReuseIdea(title: "Mini Planter", description: "Poke drainage holes and use for small plants or herbs.", difficulty: .easy, icon: "leaf.arrow.circlepath"),
                ReuseIdea(title: "Craft Material", description: "Cut and shape for DIY art projects.", difficulty: .medium, icon: "paintbrush.fill")
            ],
            disposalInstructions: "Rinse and crush. Place in metal recycling or blue bin.",
            recyclingTips: ["Crushing saves space", "Remove tabs if required locally", "Extremely valuable - always recycle!"]
        ),
        
        EcoItem(
            name: "Food Scraps",
            icon: "carrot.fill",
            category: "Organic",
            disposalType: .organic,
            environmentalImpact: "Food waste in landfills produces methane. Composting returns nutrients to soil and reduces emissions.",
            decompositionTime: "2 weeks - 2 months (in compost)",
            carbonFootprint: "High in landfill, neutral in compost",
            reuseIdeas: [
                ReuseIdea(title: "Compost", description: "Add to compost bin to create nutrient-rich soil.", difficulty: .easy, icon: "leaf.fill"),
                ReuseIdea(title: "Vegetable Regrowth", description: "Some vegetables like green onions can regrow in water.", difficulty: .medium, icon: "arrow.clockwise"),
                ReuseIdea(title: "Natural Dye", description: "Use vegetable scraps to create natural fabric dyes.", difficulty: .advanced, icon: "paintpalette.fill")
            ],
            disposalInstructions: "Place in green compost bin or home compost pile.",
            recyclingTips: ["No meat or dairy in basic compost", "Chop large items", "Balance green and brown materials"]
        ),
        
        EcoItem(
            name: "Battery",
            icon: "battery.100.bolt",
            category: "Electronics",
            disposalType: .hazardous,
            environmentalImpact: "Batteries contain toxic heavy metals that can contaminate soil and water if not disposed properly.",
            decompositionTime: "100+ years with toxic leaching",
            carbonFootprint: "High - Contains hazardous materials",
            reuseIdeas: [
                ReuseIdea(title: "Battery Tester", description: "Use a battery tester to verify if batteries still have charge.", difficulty: .easy, icon: "bolt.fill"),
                ReuseIdea(title: "Switch to Rechargeable", description: "Invest in rechargeable batteries to reduce waste.", difficulty: .easy, icon: "arrow.circlepath"),
                ReuseIdea(title: "Proper Collection", description: "Collect dead batteries for proper recycling events.", difficulty: .easy, icon: "tray.fill")
            ],
            disposalInstructions: "Never throw in regular trash. Take to designated battery collection point or hazardous waste facility.",
            recyclingTips: ["Tape terminals of lithium batteries", "Store in non-metal container", "Check local collection events"]
        ),
        
        EcoItem(
            name: "Cardboard Box",
            icon: "shippingbox.fill",
            category: "Paper",
            disposalType: .recyclable,
            environmentalImpact: "Cardboard is biodegradable and highly recyclable. Reusing boxes reduces manufacturing demand.",
            decompositionTime: "2-3 months",
            carbonFootprint: "Low - Biodegradable and recyclable",
            reuseIdeas: [
                ReuseIdea(title: "Storage Box", description: "Use for organizing items in closets or garage.", difficulty: .easy, icon: "archivebox.fill"),
                ReuseIdea(title: "Shipping Reuse", description: "Reuse for mailing packages or moving items.", difficulty: .easy, icon: "shippingbox"),
                ReuseIdea(title: "Cat House", description: "Create a fun playhouse for cats with cutout windows.", difficulty: .medium, icon: "pawprint.fill")
            ],
            disposalInstructions: "Break down flat. Remove tape and labels. Place in blue recycling bin.",
            recyclingTips: ["Keep dry - wet cardboard can't be recycled", "Remove all packing materials", "Flatten to save space"]
        ),
        
        EcoItem(
            name: "Plastic Bag",
            icon: "bag.fill",
            category: "Plastic",
            disposalType: .recyclable,
            environmentalImpact: "Plastic bags are a major ocean pollutant. They take centuries to decompose and harm wildlife.",
            decompositionTime: "10-1000 years",
            carbonFootprint: "High - Petroleum-based",
            reuseIdeas: [
                ReuseIdea(title: "Trash Liner", description: "Reuse as small trash bin liners instead of buying new.", difficulty: .easy, icon: "trash"),
                ReuseIdea(title: "Shoe Protection", description: "Use to cover shoes in wet conditions.", difficulty: .easy, icon: "shoe.fill"),
                ReuseIdea(title: "Packing Material", description: "Stuff bags with other bags for cushioning packages.", difficulty: .easy, icon: "cube.box.fill")
            ],
            disposalInstructions: "Take to store drop-off locations (most grocery stores). Not in curbside recycling.",
            recyclingTips: ["Must be clean and dry", "Bunch multiple bags together", "Best option: Switch to reusable bags"]
        ),
        EcoItem(
            name: "Egg Shells",
            icon: "circle.grid.cross",
            category: "Organic",
            disposalType: .organic,
            environmentalImpact: "Egg shells are biodegradable and enrich compost with calcium.",
            decompositionTime: "2–4 weeks",
            carbonFootprint: "Low",
            reuseIdeas: [
                ReuseIdea(title: "Compost Booster", description: "Crush and add to compost for calcium.", difficulty: .easy, icon: "leaf.fill")
            ],
            disposalInstructions: "Place in compost or green bin.",
            recyclingTips: ["Crush before composting"]
        ),
        
        EcoItem(
            name: "Tea Waste",
            icon: "cup.and.saucer.fill",
            category: "Organic",
            disposalType: .organic,
            environmentalImpact: "Tea leaves are biodegradable and compost-friendly.",
            decompositionTime: "1–2 weeks",
            carbonFootprint: "Low",
            reuseIdeas: [
                ReuseIdea(title: "Plant Fertilizer", description: "Mix tea waste with soil.", difficulty: .easy, icon: "leaf.fill")
            ],
            disposalInstructions: "Place in compost bin.",
            recyclingTips: ["Avoid plastic tea bags"]
        ),
        
        EcoItem(
            name: "Aluminum Foil",
            icon: "square.on.square",
            category: "Metal",
            disposalType: .recyclable,
            environmentalImpact: "Aluminum is recyclable but food contamination reduces recyclability.",
            decompositionTime: "200–400 years",
            carbonFootprint: "Medium",
            reuseIdeas: [
                ReuseIdea(title: "Cleaning Tool", description: "Use to scrub utensils.", difficulty: .easy, icon: "sparkles")
            ],
            disposalInstructions: "Clean and recycle in metal recycling.",
            recyclingTips: ["Must be clean"]
        ),
        
        EcoItem(
            name: "Shampoo Bottle",
            icon: "drop.triangle.fill",
            category: "Plastic",
            disposalType: .recyclable,
            environmentalImpact: "Plastic bottles pollute oceans if not recycled.",
            decompositionTime: "400+ years",
            carbonFootprint: "Medium",
            reuseIdeas: [
                ReuseIdea(title: "Refill Container", description: "Reuse with refill packs.", difficulty: .easy, icon: "arrow.triangle.2.circlepath")
            ],
            disposalInstructions: "Rinse and recycle in plastic bin.",
            recyclingTips: ["Remove cap if required"]
        ),
        
        EcoItem(
            name: "Razor",
            icon: "scissors",
            category: "Mixed",
            disposalType: .general,
            environmentalImpact: "Disposable razors are not recyclable due to mixed materials.",
            decompositionTime: "500+ years",
            carbonFootprint: "High",
            reuseIdeas: [],
            disposalInstructions: "Dispose in general waste.",
            recyclingTips: ["Switch to metal safety razors"]
        ),
        EcoItem(
            name: "Earphones",
            icon: "earbuds",
            category: "E-Waste",
            disposalType: .hazardous,
            environmentalImpact: "Electronic waste contains metals and plastics harmful to the environment.",
            decompositionTime: "100+ years",
            carbonFootprint: "High",
            reuseIdeas: [],
            disposalInstructions: "Take to e-waste collection center.",
            recyclingTips: ["Do not throw in regular trash"]
        ),
        
        EcoItem(
            name: "CFL Bulb",
            icon: "lightbulb.slash.fill",
            category: "Electronics",
            disposalType: .hazardous,
            environmentalImpact: "CFL bulbs contain mercury and are hazardous.",
            decompositionTime: "Unknown",
            carbonFootprint: "High",
            reuseIdeas: [],
            disposalInstructions: "Dispose at authorized hazardous waste facility.",
            recyclingTips: ["Never break CFL bulbs"]
        ),
        EcoItem(
            name: "Pen",
            icon: "pencil",
            category: "Stationery",
            disposalType: .general,
            environmentalImpact: "Plastic pens are rarely recyclable.",
            decompositionTime: "450+ years",
            carbonFootprint: "Medium",
            reuseIdeas: [
                ReuseIdea(title: "Refill Pen", description: "Use refillable pens to reduce waste.", difficulty: .easy, icon: "arrow.clockwise")
            ],
            disposalInstructions: "Dispose in general waste.",
            recyclingTips: ["Choose refillable pens"]
        ),
        
        EcoItem(
            name: "Notebook",
            icon: "book.fill",
            category: "Paper",
            disposalType: .recyclable,
            environmentalImpact: "Paper is recyclable and biodegradable.",
            decompositionTime: "2–6 weeks",
            carbonFootprint: "Low",
            reuseIdeas: [
                ReuseIdea(title: "Use Blank Pages", description: "Use remaining pages for rough work.", difficulty: .easy, icon: "note.text")
            ],
            disposalInstructions: "Remove plastic covers and recycle paper.",
            recyclingTips: ["Avoid laminated covers"]
        ),
        EcoItem(
            name: "Marker Pen",
            icon: "highlighter",
            category: "Stationery",
            disposalType: .general,
            environmentalImpact: "Plastic markers are non-recyclable.",
            decompositionTime: "400+ years",
            carbonFootprint: "Medium",
            reuseIdeas: [],
            disposalInstructions: "General waste.",
            recyclingTips: ["Choose refillable markers"]
        ),
        
        EcoItem(
            name: "Assignment Papers",
            icon: "doc.text",
            category: "Paper",
            disposalType: .recyclable,
            environmentalImpact: "Paper waste increases deforestation.",
            decompositionTime: "2–6 weeks",
            carbonFootprint: "Low",
            reuseIdeas: [],
            disposalInstructions: "Recycle in paper bin.",
            recyclingTips: ["Remove staples"]
        ),
        
        EcoItem(
            name: "ID Card Lanyard",
            icon: "person.text.rectangle",
            category: "Mixed",
            disposalType: .general,
            environmentalImpact: "Fabric and plastic mix.",
            decompositionTime: "200+ years",
            carbonFootprint: "Medium",
            reuseIdeas: [],
            disposalInstructions: "General waste.",
            recyclingTips: ["Reuse if possible"]
        ),
        
        EcoItem(
            name: "Mobile Phone",
            icon: "iphone",
            category: "E-Waste",
            disposalType: .hazardous,
            environmentalImpact: "Contains heavy metals.",
            decompositionTime: "1000+ years",
            carbonFootprint: "Very High",
            reuseIdeas: [],
            disposalInstructions: "E-waste collection.",
            recyclingTips: ["Never landfill"]
        ),
        
        EcoItem(
            name: "USB Cable",
            icon: "cable.connector",
            category: "E-Waste",
            disposalType: .hazardous,
            environmentalImpact: "Plastic and metal waste.",
            decompositionTime: "100+ years",
            carbonFootprint: "High",
            reuseIdeas: [],
            disposalInstructions: "E-waste bin.",
            recyclingTips: ["Donate if working"]
        ),
        
        EcoItem(
            name: "Power Bank",
            icon: "battery.100",
            category: "E-Waste",
            disposalType: .hazardous,
            environmentalImpact: "Lithium battery hazard.",
            decompositionTime: "100+ years",
            carbonFootprint: "High",
            reuseIdeas: [],
            disposalInstructions: "E-waste center.",
            recyclingTips: ["Avoid damage"]
        ),
        
        EcoItem(
            name: "Toothpaste Tube",
            icon: "capsule",
            category: "Plastic",
            disposalType: .general,
            environmentalImpact: "Multi-layer tubes are non-recyclable.",
            decompositionTime: "500+ years",
            carbonFootprint: "High",
            reuseIdeas: [],
            disposalInstructions: "General waste.",
            recyclingTips: ["Switch to eco toothpaste"]
        ),
        
        EcoItem(
            name: "Sanitary Pad",
            icon: "bandage",
            category: "Hygiene",
            disposalType: .general,
            environmentalImpact: "Contains plastic and chemicals.",
            decompositionTime: "500–800 years",
            carbonFootprint: "High",
            reuseIdeas: [],
            disposalInstructions: "Wrap and dispose safely.",
            recyclingTips: ["Do not recycle"]
        ),
        
        EcoItem(
            name: "Baby Diaper",
            icon: "figure.child",
            category: "Hygiene",
            disposalType: .general,
            environmentalImpact: "Major landfill contributor.",
            decompositionTime: "500+ years",
            carbonFootprint: "High",
            reuseIdeas: [],
            disposalInstructions: "General waste.",
            recyclingTips: ["Use cloth diapers"]
        ),
        
        EcoItem(
            name: "Disposable Plate",
            icon: "circle",
            category: "Disposable",
            disposalType: .general,
            environmentalImpact: "Single-use plates increase landfill waste.",
            decompositionTime: "20+ years",
            carbonFootprint: "Medium",
            reuseIdeas: [],
            disposalInstructions: "General waste.",
            recyclingTips: ["Use reusable plates"]
        ),
        
        EcoItem(
            name: "Disposable Spoon",
            icon: "fork.knife",
            category: "Disposable",
            disposalType: .general,
            environmentalImpact: "Plastic cutlery pollutes oceans.",
            decompositionTime: "200+ years",
            carbonFootprint: "High",
            reuseIdeas: [],
            disposalInstructions: "General waste.",
            recyclingTips: ["Avoid single-use plastics"]
        ),
        
        EcoItem(
            name: "Paper Cup",
            icon: "cup.and.saucer",
            category: "Paper",
            disposalType: .general,
            environmentalImpact: "Paper cups have plastic lining.",
            decompositionTime: "30+ years",
            carbonFootprint: "Medium",
            reuseIdeas: [],
            disposalInstructions: "General waste.",
            recyclingTips: ["Prefer reusable cups"]
        ),
        
        EcoItem(
            name: "Pizza Box (Greasy)",
            icon: "shippingbox",
            category: "Paper",
            disposalType: .general,
            environmentalImpact: "Grease prevents recycling.",
            decompositionTime: "2 months",
            carbonFootprint: "Medium",
            reuseIdeas: [],
            disposalInstructions: "General waste.",
            recyclingTips: ["Clean boxes only recyclable"]
        ),
        
        EcoItem(
            name: "Vegetable Peels",
            icon: "leaf",
            category: "Organic",
            disposalType: .organic,
            environmentalImpact: "Vegetable waste decomposes naturally and enriches soil.",
            decompositionTime: "1–3 weeks",
            carbonFootprint: "Low",
            reuseIdeas: [],
            disposalInstructions: "Compost or green bin.",
            recyclingTips: ["Ideal for composting"]
        ),
        
        EcoItem(
            name: "Fruit Peels",
            icon: "applelogo",
            category: "Organic",
            disposalType: .organic,
            environmentalImpact: "Fruit waste produces methane if landfilled.",
            decompositionTime: "2–4 weeks",
            carbonFootprint: "Low",
            reuseIdeas: [],
            disposalInstructions: "Compost or green bin.",
            recyclingTips: ["Avoid plastic mixing"]
        ),
        
        EcoItem(
            name: "Bread Waste",
            icon: "takeoutbag.and.cup.and.straw",
            category: "Organic",
            disposalType: .organic,
            environmentalImpact: "Food waste causes methane emissions in landfills.",
            decompositionTime: "1–2 weeks",
            carbonFootprint: "Medium",
            reuseIdeas: [],
            disposalInstructions: "Compost.",
            recyclingTips: ["Keep dry"]
        ),
        
        EcoItem(
            name: "Oil Packet",
            icon: "drop",
            category: "Plastic",
            disposalType: .general,
            environmentalImpact: "Oil-contaminated plastic is hard to recycle.",
            decompositionTime: "100+ years",
            carbonFootprint: "High",
            reuseIdeas: [],
            disposalInstructions: "General waste.",
            recyclingTips: ["Do not recycle"]
        ),
        
        EcoItem(
            name: "Chocolate Wrapper",
            icon: "square",
            category: "Plastic",
            disposalType: .general,
            environmentalImpact: "Multi-layer plastics pollute land.",
            decompositionTime: "100+ years",
            carbonFootprint: "High",
            reuseIdeas: [],
            disposalInstructions: "General waste.",
            recyclingTips: ["Avoid littering"]
        ),
        
        EcoItem(
            name: "Coffee Grounds",
            icon: "cup.and.line.vertical.fill",
            category: "Organic",
            disposalType: .organic,
            environmentalImpact: "Coffee grounds are rich in nitrogen. In landfills, they contribute to methane, but in soil, they are a powerhouse of nutrients.",
            decompositionTime: "1–3 months",
            carbonFootprint: "Low - If composted",
            reuseIdeas: [
                ReuseIdea(title: "Natural Scrub", description: "Mix with coconut oil for an eco-friendly skin exfoliant.", difficulty: .easy, icon: "hand.raised.fill"),
                ReuseIdea(title: "Fridge Deodorizer", description: "Place dried grounds in a bowl to absorb unwanted smells.", difficulty: .easy, icon: "wind")
            ],
            disposalInstructions: "Place in green compost bin or mix directly into garden soil.",
            recyclingTips: ["Ensure they are cool before adding to compost", "Do not put in the sink as they clog pipes"]
        ),
        
        EcoItem(
            name: "Milk Carton (Tetra Pak)",
            icon: "square.fill",
            category: "Mixed",
            disposalType: .recyclable,
            environmentalImpact: "Multi-layered (paper, plastic, and aluminum) makes them harder to process than regular paper.",
            decompositionTime: "5 years",
            carbonFootprint: "Medium",
            reuseIdeas: [
                ReuseIdea(title: "Bird House", description: "Cut a hole, paint it, and hang it for small birds.", difficulty: .medium, icon: "bird"),
                ReuseIdea(title: "Seedling Starter", description: "Cut the bottom half to start growing seeds.", difficulty: .easy, icon: "leaf")
            ],
            disposalInstructions: "Rinse and flatten. Check if local recycling accepts 'Cartons'.",
            recyclingTips: ["Push the straw inside or recycle it separately", "Must be completely empty"]
        ),
        
        EcoItem(
            name: "Styrofoam",
            icon: "square.dashed",
            category: "Plastic",
            disposalType: .general,
            environmentalImpact: "Styrofoam is non-biodegradable and breaks into tiny pieces that animals mistake for food.",
            decompositionTime: "500+ years (never fully disappears)",
            carbonFootprint: "Very High",
            reuseIdeas: [],
            disposalInstructions: "Dispose in general waste. Avoid using it whenever possible.",
            recyclingTips: ["Look for specialized EPS recycling centers", "Switch to mushroom packaging or cardboard"]
        ),
        
        EcoItem(
            name: "Old Cotton T-Shirt",
            icon: "tshirt.fill",
            category: "Textile",
            disposalType: .general,
            environmentalImpact: "Textile production is water-intensive. Decomposition in landfills produces greenhouse gases.",
            decompositionTime: "1–5 months",
            carbonFootprint: "Medium",
            reuseIdeas: [
                ReuseIdea(title: "Cleaning Rags", description: "Cut into squares for dusting and spills.", difficulty: .easy, icon: "wand.and.stars"),
                ReuseIdea(title: "Tote Bag", description: "Sew the bottom and cut the sleeves to make a grocery bag.", difficulty: .medium, icon: "bag")
            ],
            disposalInstructions: "Donate if wearable. If not, take to a textile recycling drop-off.",
            recyclingTips: ["Ensure it is clean and dry", "Remove plastic buttons if possible"]
        ),
        
        EcoItem(
            name: "Ink Cartridge",
            icon: "printer.fill",
            category: "E-Waste",
            disposalType: .hazardous,
            environmentalImpact: "Residual ink contains heavy metals and chemicals that leak into the water table.",
            decompositionTime: "450–1000 years",
            carbonFootprint: "High",
            reuseIdeas: [
                ReuseIdea(title: "Refill Station", description: "Take it to a shop to be refilled instead of buying new.", difficulty: .easy, icon: "drop.fill")
            ],
            disposalInstructions: "Return to the manufacturer or drop at an office supply store.",
            recyclingTips: ["Seal in a bag to prevent leaking during transport"]
        ),
        
        EcoItem(
            name: "Wine Cork",
            icon: "capsule.portrait.fill",
            category: "Organic",
            disposalType: .organic,
            environmentalImpact: "Natural cork is a renewable resource. Synthetic corks, however, are plastic-based.",
            decompositionTime: "3–10 years",
            carbonFootprint: "Very Low",
            reuseIdeas: [
                ReuseIdea(title: "Pin Board", description: "Glue many corks together to make a bulletin board.", difficulty: .medium, icon: "pin.fill"),
                ReuseIdea(title: "Plant Markers", description: "Write plant names on corks and stick them on a skewer.", difficulty: .easy, icon: "tag")
            ],
            disposalInstructions: "Natural cork goes in compost. Synthetic cork goes in general waste.",
            recyclingTips: ["Check if it's real wood cork or plastic foam"]
        ),
        
        EcoItem(
            name: "Glass Bottle",
            icon: "wineglass.fill",
            category: "Glass",
            disposalType: .recyclable,
            environmentalImpact: "Glass can be recycled forever, but it is heavy to transport, increasing fuel emissions.",
            decompositionTime: "1 million years",
            carbonFootprint: "Medium",
            reuseIdeas: [
                ReuseIdea(title: "Oil Dispenser", description: "Clean and use for kitchen oils or vinegar.", difficulty: .easy, icon: "drop"),
                ReuseIdea(title: "Decorative Vase", description: "Paint the outside to create a flower vase.", difficulty: .easy, icon: "flower.fill")
            ],
            disposalInstructions: "Rinse and place in the glass-specific recycling bin.",
            recyclingTips: ["Don't mix with window glass or Pyrex", "Remove metal rings"]
        ),
        
        EcoItem(
            name: "Steel Spoon",
            icon: "fork.knife",
            category: "Metal",
            disposalType: .recyclable,
            environmentalImpact: "Metal mining is destructive, but steel is the most recycled material on Earth.",
            decompositionTime: "50–100 years",
            carbonFootprint: "Medium",
            reuseIdeas: [
                ReuseIdea(title: "Garden Trowel", description: "Use old sturdy spoons for small potting tasks.", difficulty: .easy, icon: "leaf.fill")
            ],
            disposalInstructions: "Donate if usable. Otherwise, take to a scrap metal recycler.",
            recyclingTips: ["Check with a magnet; if it sticks, it's likely steel"]
        ),
        
        EcoItem(
            name: "Grass Clippings",
            icon: "wind",
            category: "Organic",
            disposalType: .organic,
            environmentalImpact: "When left on the lawn, they return 25% of the nutrients back to the soil.",
            decompositionTime: "2–4 weeks",
            carbonFootprint: "Neutral",
            reuseIdeas: [
                ReuseIdea(title: "Mulching", description: "Spread around plants to retain moisture and stop weeds.", difficulty: .easy, icon: "square.stack.3d.down.right")
            ],
            disposalInstructions: "Place in green bin or leave on the lawn (grasscycling).",
            recyclingTips: ["Don't compost if treated with chemical weedkillers"]
        ),
        
        EcoItem(
            name: "Magazines",
            icon: "newspaper",
            category: "Paper",
            disposalType: .recyclable,
            environmentalImpact: "Glossy paper uses more chemicals and inks than newsprint but is still recyclable.",
            decompositionTime: "6 months",
            carbonFootprint: "Low",
            reuseIdeas: [
                ReuseIdea(title: "Collage Art", description: "Use colorful pages for scrapbooking or art.", difficulty: .easy, icon: "paintpalette"),
                ReuseIdea(title: "Envelope Liner", description: "Use bright pages to line handmade envelopes.", difficulty: .medium, icon: "envelope")
            ],
            disposalInstructions: "Place in the blue paper recycling bin.",
            recyclingTips: ["Remove any plastic wrapping or samples inside"]
        ),
        
        EcoItem(
            name: "LED Lightbulb",
            icon: "lightbulb.fill",
            category: "Electronics",
            disposalType: .hazardous,
            environmentalImpact: "LEDs are efficient but contain circuit boards and metals that shouldn't be landfilled.",
            decompositionTime: "Unknown (non-biodegradable)",
            carbonFootprint: "Medium - High energy to manufacture",
            reuseIdeas: [
                ReuseIdea(title: "Christmas Ornament", description: "Paint the bulb and add a string to hang on a tree.", difficulty: .easy, icon: "tree.fill")
            ],
            disposalInstructions: "Take to a specialized hardware store or e-waste center.",
            recyclingTips: ["Do not put in glass recycling"]
        ),
        EcoItem(
            name: "Mirror",
            icon: "square.on.square.dashed",
            category: "Glass",
            disposalType: .general,
            environmentalImpact: "Mirror glass has a chemical backing that makes it non-recyclable with standard glass bottles.",
            decompositionTime: "1 million years",
            carbonFootprint: "High",
            reuseIdeas: [
                ReuseIdea(title: "Mosaic Art", description: "Break safely and use pieces for a mosaic frame.", difficulty: .advanced, icon: "puzzlepiece.fill")
            ],
            disposalInstructions: "Wrap in newspaper and place in general waste if broken.",
            recyclingTips: ["Consider donating if still intact"]
        ),
        EcoItem(
            name: "Old Keys",
            icon: "key.fill",
            category: "Metal",
            disposalType: .recyclable,
            environmentalImpact: "Keys are usually made of brass or nickel, which are highly valuable metals.",
            decompositionTime: "50-100 years",
            carbonFootprint: "Medium",
            reuseIdeas: [
                ReuseIdea(title: "Wind Chime", description: "Hang multiple keys from a piece of driftwood.", difficulty: .medium, icon: "wind")
            ],
            disposalInstructions: "Take to a scrap metal recycler.",
            recyclingTips: ["Remove plastic key caps first"]
        ),
        EcoItem(
            name: "Yoga Mat",
            icon: "rectangle.fill",
            category: "Plastic",
            disposalType: .general,
            environmentalImpact: "Most mats are made of PVC, which is difficult to recycle and non-biodegradable.",
            decompositionTime: "Unknown",
            carbonFootprint: "High",
            reuseIdeas: [
                ReuseIdea(title: "Knee Pad", description: "Cut into squares for gardening knee pads.", difficulty: .easy, icon: "leaf.fill"),
                ReuseIdea(title: "Shelf Liner", description: "Cut to fit kitchen drawers to prevent sliding.", difficulty: .easy, icon: "suirase.fill")
            ],
            disposalInstructions: "General waste if no specialized programs exist.",
            recyclingTips: ["Look for biodegradable cork or rubber mats next time"]
        ),
        
        EcoItem(
            name: "LED Lightbulb",
            icon: "lightbulb.fill",
            category: "Electronics",
            disposalType: .hazardous,
            environmentalImpact: "LEDs are efficient but contain circuit boards and metals that shouldn't be landfilled.",
            decompositionTime: "Unknown (non-biodegradable)",
            carbonFootprint: "Medium - High energy to manufacture",
            reuseIdeas: [
                ReuseIdea(title: "Christmas Ornament", description: "Paint the bulb and add a string to hang on a tree.", difficulty: .easy, icon: "tree.fill")
            ],
            disposalInstructions: "Take to a specialized hardware store or e-waste center.",
            recyclingTips: ["Do not put in glass recycling"]
        )
    ]
    
}
