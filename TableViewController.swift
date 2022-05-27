

import UIKit

class TableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate, UISearchResultsUpdating  {
    
    
    
    let searchController = UISearchController()
    
    @IBOutlet weak var shapeTableView: UITableView!
    
    var shapeList = [Shape]()
    var filteredShapes = [Shape]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initList()
        initSearchController()
    }
    
    func initSearchController(){
        searchController.loadViewIfNeeded()
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.enablesReturnKeyAutomatically = false
        searchController.searchBar.returnKeyType = UIReturnKeyType.done
        definesPresentationContext = true
        
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.searchBar.scopeButtonTitles = ["All", "Recycle", "Home", "Street", "Room"]
        searchController.searchBar.delegate = self
    }
    
    func initList(){
        let b = Shape(id: "0", name: "RecycleBin", imageName:"Image" )
        shapeList.append(b)
        let i = Shape(id: "1", name: "RecycleBin", imageName:"Image-1" )
        shapeList.append(i)
        let n = Shape(id: "2", name: "Bin for home", imageName:"Image-21" )
        shapeList.append(n)
        let r = Shape(id: "3", name: "Bin for toilet", imageName:"Image-22" )
        shapeList.append(r)
        let cycleBin = Shape(id: "4", name: "RecycleBin", imageName:"Image-25" )
        shapeList.append(cycleBin)
        let recycleB = Shape(id: "5", name: "RecycleBin", imageName:"Image-30" )
        shapeList.append(recycleB)
        let recycleBi = Shape(id: "6", name: "Bin for building", imageName:"Image-31" )
        shapeList.append(recycleBi)
        let cycle = Shape(id: "7", name: "Bin for room", imageName:"Image-32" )
        shapeList.append(cycle)
        let ecycle = Shape(id: "8", name: "Bin street", imageName:"Image-33" )
        shapeList.append(ecycle)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(searchController.isActive){
            return filteredShapes.count
        }
        return shapeList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableViewCell = tableView.dequeueReusableCell(withIdentifier: "tableViewCellID")as!
        TableViewCell
        
        let thisShape:Shape!
        
        if(searchController.isActive){
        thisShape = filteredShapes[indexPath.row]
        }
        else{
           thisShape = shapeList[indexPath.row]
        }
        
        tableViewCell.shapeName.text = thisShape.id + " " + thisShape.name
        tableViewCell.shapeImage.image = UIImage(named: thisShape.name)
        
        return tableViewCell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "detailSegue", sender: self)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "detailSegue"){
            let indexPath = self.shapeTableView.indexPathForSelectedRow!
            
            let tableViewDetail = segue.destination as? TableViewDetail
            
            let selectedShape:Shape!
            
            if(searchController.isActive){
            selectedShape = filteredShapes[indexPath.row]
            }
            else{
               selectedShape = shapeList[indexPath.row]
            }
            
            
            tableViewDetail!.selectedShape = selectedShape
            
            self.shapeTableView.deselectRow(at: indexPath, animated: true)
            
        }
    }
    
    
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        let scopeButton = searchBar.scopeButtonTitles![searchBar.selectedScopeButtonIndex]
        let searchText = searchBar.text!
        
        filterForSearchTextAndScopeButton(searchText: searchText, scopeButton: scopeButton)
    }
    
    func  filterForSearchTextAndScopeButton(searchText: String, scopeButton: String = "All"){
        filteredShapes = shapeList.filter
        {
            shape in
            let scopeMatch = (scopeButton == "All" || shape.name.lowercased().contains(scopeButton.lowercased()))
            if(searchController.searchBar.text != ""){
                let searchTextMatch = shape.name.lowercased().contains(searchText.lowercased())
                
                return scopeMatch && searchTextMatch
            }
            else{
                return scopeMatch
            }
        }
        shapeTableView.reloadData()
    }

}

