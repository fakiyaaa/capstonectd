//
//  ViewController.swift
//  ios101-project6-tumblr
//

import UIKit
import Nuke

struct Internship {
    let title: String
    let description: String
    let imageUrl: String
}

class ViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!


        override func viewDidLoad() {
            super.viewDidLoad()
            tableView.dataSource = self
            tableView.reloadData()
        }

        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return internships.count
        }

        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell", for: indexPath) as! PostCell
            let internship = internships[indexPath.row]

            cell.summaryLabel.text = internship.title + " - " + internship.description

            if let url = URL(string: internship.imageUrl) {
                Nuke.loadImage(with: url, into: cell.postImageView)
            }

            return cell
        }
    }
