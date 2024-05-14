import React, { useEffect, useState } from 'react';
import { Text, View, StyleSheet, TouchableOpacity, ActivityIndicator } from 'react-native';

export default function EvalScreen({ navigation }) {

    const matriculeVar = 2051798;

    const [classData, setClassData] = useState(null);
    const [sessionActData, setSessionActData] = useState(null);
    const [loading, setLoading] = useState(true);


    // Liens BD locale

    const urlClass = `http://192.168.56.1:3000/api/cours/${matriculeVar}`;
    const urlSessionAct = `http://192.168.56.1:3000/api/sessionactuelle/${matriculeVar}`;


    // Liens BD remote
    /*
    const urlClass = `https://eduportail-69af4de32dad.herokuapp.com/api/cours/${matriculeVar}`;
    const urlSessionAct = `https://eduportail-69af4de32dad.herokuapp.com/api/sessionactuelle/${matriculeVar}`;
    */

    useEffect(() => {
        fetchData(urlClass, setClassData);
        fetchData(urlSessionAct, setSessionActData);
    }, []);

    const fetchData = (url, setData) => {
        fetch(url)
            .then((resp) => {
                if (!resp.ok) {
                    throw new Error('Network response was not ok');
                }
                return resp.json();
            })
            .then((json) => setData(json))
            .catch((error) => console.error('Error fetching data:', error))
            .finally(() => setLoading(false));
    };

    const renderButtons = () => {

        const buttonItems = [];

        for (let i = 0; i < (classData ? classData.length : 0); i++) {
            buttonItems.push(
                <View style={styles.classRow} key={i}>
                    <TouchableOpacity style={styles.classButton} onPress={() => navigation.navigate('EvalClass', {id: classData ? classData[i].idInscription : ''})}>
                        <Text style={styles.sigleText}>{classData ? classData[i].sigle : ''}</Text>
                        <Text style={styles.classText}>{classData ? classData[i].titreCours : ''}</Text>
                    </TouchableOpacity>
                </View>
            );
        }

        return buttonItems;
    }

    return (
        <View style={styles.mainContainer}>
            {loading ? (
                <ActivityIndicator />
            ) : (
            <View style={styles.container}>
                <Text style={styles.evalTitle}>Mes évaluations</Text>

                {/*use api to display session*/}
                <Text style={styles.evalSessionText}>Session actuelle: {sessionActData ? sessionActData.nomSession : ''}</Text>

                <View style={styles.classLabels}>
                    <Text style={styles.sigleLabel}>Sigle</Text>
                    <Text style={styles.titleLabel}>Titre du cour</Text>
                </View>
                <View style={styles.classContainer}>
                    {renderButtons()}
                </View>
            </View>
            )}
        </View>
    );
}

const styles = StyleSheet.create({
    //main Container
    mainContainer: {
        flex: 1,
        backgroundColor: '#e7eff6',
    },
    container: {
        flex: 1,
        alignItems: 'center',
        justifyContent: 'flex-end',
    },
    evalTitle: {
        position: 'absolute',
        top: 50,
        alignItems: 'center',
        fontSize: 40,
        fontWeight: 'bold',
    },
    evalSessionText: {
        position: 'absolute',
        top: 125,
        left: 40,
        fontSize: 18
    },
    classLabels: {
        flexDirection: 'row',
        width: '80%',
        position: 'absolute',
        top: 200
    },
    sigleLabel: {
        flex: 1,
        marginLeft: 5,
        fontWeight: 'bold',
    },
    titleLabel: {
        marginRight: 150,
        fontWeight: 'bold',
    },
    classContainer: {
        width: '90%',
        position: 'absolute',
        top: 225,
    },
    classRow: {
        paddingBottom: 2,
    },
    classButton: {
        flexDirection: 'row',
        backgroundColor: '#4b86b4',
        height: 70,
        alignItems: 'center',
        borderRadius: 5,
    },
    sigleText: {
        flex: 1,
        marginLeft: 15,
        fontSize: 20,
        fontWeight: 'bold',
        color: 'white'
    },
    classText: {
        flex: 2,
        marginRight: 25,
        fontWeight: 'bold',
        color: 'white'
    },
})